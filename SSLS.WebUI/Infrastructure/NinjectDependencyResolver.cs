using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ninject;
using System.Web.Mvc;
using SSLS.Domain.Abstract;
using SSLS.Domain.Concrete;
using SSLS.WebUI.Infrastructure.Abstract;
using SSLS.WebUI.Infrastructure.Concrete;
namespace SSLS.WebUI.Infrastructure
{
    public class NinjectDependencyResolver : IDependencyResolver
    {
        private IKernel kernel;
        public NinjectDependencyResolver(IKernel kernelParam)
        {
            kernel = kernelParam;
            AddBindings();
        }

        public object GetService(Type serviceType)
        {
            return kernel.TryGet(serviceType);
        }

        public IEnumerable<object> GetServices(Type serviceType)
        {
            return kernel.GetAll(serviceType);
        }

        private void AddBindings()
        {
            kernel.Bind<IProductsRepository>().To<EFProductRepository>();
            //kernel.Bind<IReaderRepository>().To<EFReaderRepository>();
            //EmailSettings emailSettings = new EmailSettings();
            //kernel.Bind<IReaderRepository>().To<EFReaderRepository>().WithConstructorArgument("settings", emailSettings);
            kernel.Bind<IReaderRepository>().To<EFReaderRepository>();
            kernel.Bind<IWorkHelp>().To<databaseWorkHelp>();
        }
    }
}