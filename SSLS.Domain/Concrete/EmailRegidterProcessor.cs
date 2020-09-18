using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SSLS.Domain.Abstract;
using System.Configuration;
using System.Net.Mail;
using System.Net;
namespace SSLS.Domain.Concrete
{
    public class EmailSettings
    {
        public string MailToAddress = ConfigurationManager.AppSettings["MailToAddress"];
        public string MailFromAddress = ConfigurationManager.AppSettings["MailFromAddress"];
        public bool UseSsl = bool.Parse(ConfigurationManager.AppSettings["UseSsl"] ?? "true");
        public string Username = ConfigurationManager.AppSettings["Username"];
        public string Password = ConfigurationManager.AppSettings["Password"];
        public string ServerName = ConfigurationManager.AppSettings["ServerName"];
        public int ServerPort = int.Parse(ConfigurationManager.AppSettings["ServerPort"] ?? "587");
    }
    public class EmailRegisterProcessor 
    {
        private EmailSettings emailSettings;
        public EmailRegisterProcessor(EmailSettings settings)
        {
            emailSettings = settings;
        }
        public void RegisterEmail(string Name, string Email, string Password)
        {
            SmtpClient smtp = new SmtpClient();
            using (var smtpClient = new SmtpClient())
            {
                smtpClient.EnableSsl = emailSettings.UseSsl;
                smtpClient.Host = emailSettings.ServerName;
                smtpClient.Port = emailSettings.ServerPort;
                smtpClient.UseDefaultCredentials = true;
                smtpClient.Credentials = new NetworkCredential(emailSettings.Username, emailSettings.Password);
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                StringBuilder body = new StringBuilder();
                body.AppendLine(string.Format("欢迎使用心诚图书馆，用户：{0}，\n您的注册账号为{1},\n密码为{2}", Name,Email,Password));
                MailMessage mailMessage = new MailMessage(
                    emailSettings.MailFromAddress,
                    Email,
                    string.Format("注册时间 {0}", System.DateTime.Now.ToString()),
                    body.ToString());
                mailMessage.BodyEncoding = Encoding.UTF8;
                smtpClient.Send(mailMessage);
            }
        }
    }
}
