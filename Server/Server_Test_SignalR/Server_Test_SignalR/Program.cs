using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Server_Test_SignalR.DataLayer;
using Server_Test_SignalR.Entieis;

using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace Server_Test_SignalR
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
        Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseStartup<Startup>()
                          .UseUrls("https://192.168.32.254:443");
            });
    }
}
