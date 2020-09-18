using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SSLS.Domain.Abstract;
namespace SSLS.Domain.Concrete
{
    public class EFReaderRepository:IReaderRepository
    {
        public bool Register(string Name,string Email,string Password,string Phone, out string msg)
        {
            using (var db = new SSLSEntities())
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Reader reader;
                        reader = db.Reader.FirstOrDefault(e => e.Name == Email);
                        if (reader != null)
                        {
                            msg = "该邮箱已注册，请更换";
                            return false;
                        }
                        else
                        {
                            reader = new Reader();
                            reader.Name = Name;
                            reader.Password = Password;
                            reader.Phone = Phone;
                            reader.Email = Email;
                            reader.Balance = 0;
                            db.Reader.Add(reader);
                            db.SaveChanges();
                            EmailSettings emailSettings = new EmailSettings();
                            EmailRegisterProcessor sendEmail = new EmailRegisterProcessor(emailSettings);
                            sendEmail.RegisterEmail(Name,Email,Password);
                            dbContextTransaction.Commit();
                            msg = "注册成功，请登录";
                            return true;
                        }
                    }
                    catch (Exception ex)
                    {
                        dbContextTransaction.Rollback();
                        msg = "系统异常，注册失败";
                        return false;
                    }
                }
            }
        }
        public bool CreateBorrow(int[] checkon, Reader reader, Bookshelf bookshelf,out string msg)
        {
            using (var db = new SSLSEntities())
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        foreach (int c in checkon)
                        {
                            Book b = db.Book.FirstOrDefault(e => e.Id == c);
                            if (b != null)
                            {
                                if (b.Status == "在库")
                                {
                                    b.Status = "外借";
                                    Borrow borrow = new Borrow();
                                    borrow.Book_Id = b.Id;
                                    borrow.Reader_Id = reader.Id;
                                    borrow.BorrowTime = DateTime.Now;
                                    borrow.NeedReturnTime = DateTime.Now.AddMonths(1);
                                    borrow.Renew = 0;
                                    borrow.BorrowStatu = "未归还";
                                    bookshelf.RemoveLine(b);
                                    db.Borrow.Add(borrow);
                                    db.SaveChanges();
                                }
                                else
                                {
                                    msg="图书已外借";
                                    return false;
                                }
                            }
                            else
                            {
                                msg="图书不存在";
                                return false;
                            }
                        }
                        dbContextTransaction.Commit();
                        msg = "借阅成功";
                        return true;
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        msg="系统异常，借阅失败";
                        return false;
                    }
                }
                msg = "未知错误";
                return false;
            }
        }
        public bool ReturnBook(int id, Reader r,out string msg)
        {
            using (var db = new SSLSEntities())
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Borrow borrow;
                        borrow = db.Borrow.Find(id);
                        if (borrow != null)
                        {
                            borrow.ReturnTime = DateTime.Now;
                            Book book = db.Book.Find(borrow.Book_Id);
                            book.Status = "在库";
                            borrow.BorrowStatu = "已归还";
                            if (borrow.NeedReturnTime < DateTime.Now)
                            {
                                int a = (DateTime.Now - borrow.NeedReturnTime).Days;
                                if (a == 0)
                                {
                                    a = 1;
                                }
                                Fine fine = new Fine();
                                fine.Borrow_Id = id;
                                fine.FineMoney = (book.Price / 100) * a;
                                fine.FineTime = DateTime.Now;
                                fine.Reader_Id = borrow.Reader_Id;
                                fine.why = "超时";
                                r.Fine.Add(fine);
                                Reader reader = db.Reader.Find(borrow.Reader_Id);
                                db.Fine.Add(fine);
                            }
                            db.SaveChanges();
                            dbContextTransaction.Commit();
                            msg="图书归还成功";
                            return true;
                        }
                        else
                        {
                            msg="图书不存在，归还失败，请联系管理员人工归还";
                            return false;
                        }

                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        msg="系统异常，图书归还失败，请重试！！！";
                        return false;
                    }
                }
            }
            
        }
        public bool PayFine(int id, Reader r,out string msg)
        {
            using (var db = new SSLSEntities())
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        Fine fine = db.Fine.Find(id);
                        if (fine != null)
                        {
                            Reader reader = db.Reader.Find(fine.Reader_Id);
                            reader.Balance = reader.Balance - fine.FineMoney;
                            r.Balance = r.Balance - fine.FineMoney;
                            fine.PayFineTime = DateTime.Now;
                            db.SaveChanges();
                            dbContextTransaction.Commit();
                            msg="罚款缴纳成功,谢谢配合";
                            return true;
                        }
                        else
                        {
                            msg="该条罚款不存在，请重试！！！";
                            return false;
                        }
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        msg="系统异常，罚款缴纳失败，请重试！！！";
                        return false;
                    }
                }
            }
            
        }
    }
}
