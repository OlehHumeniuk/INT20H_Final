using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Server_Test_SignalR.Data;
using Server_Test_SignalR.DataLayer;
using Server_Test_SignalR.DataLayer.DeviseTypesDL;
using Server_Test_SignalR.Entieis;
using Server_Test_SignalR.Entieis.DeviseTypes;
using Server_Test_SignalR.Hubs;
using System.Threading.Tasks;

namespace Server_Test_SignalR
{
    public partial class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder =>
                {
                    builder.WithOrigins("http://localhost:7170") // Змініть на URL вашого Flutter додатку
                           .AllowAnyMethod()
                           .AllowAnyHeader()
                           .AllowCredentials();
                });
            });

            // Додавання служб
            services.AddScoped<DeviceTypesDL>();

            services.AddScoped<AutomotiveDevicesDL>();
            services.AddScoped<ComputingDevicesDL>();
            services.AddScoped<EducationalDeviceDL>();
            services.AddScoped<EntertainmentSystemDL>();
            services.AddScoped<HealthcareDeviceDL>();
            services.AddScoped<IndustrialControlSystemDL>();
            services.AddScoped<IoTDeviceDL>();
            services.AddScoped<MobileDeviceDL>();
            services.AddScoped<NetworkingEquipmentDL>();
            services.AddScoped<OfficeEquipmentDL>();
            services.AddScoped<SmartHomeDeviceDL>();
            services.AddScoped<WearableTechnologyDL>();
            services.AddScoped<DevicesDL>();

            services.AddScoped<ProgramHub>();

            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie();

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(
                    Configuration.GetConnectionString("DefaultConnection")));
            services.AddControllersWithViews();

            services.AddSignalR(options =>
            {
                options.EnableDetailedErrors = true;
            }).AddHubOptions<ProgramHub>(options =>
            {
                options.EnableDetailedErrors = true;
            });

            services.AddHttpContextAccessor();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IHubContext<ProgramHub> hubContext)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseCors("CorsPolicy"); // Дозвольте CORS для всіх запитів

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers(); // Для використання MVC контролери
                endpoints.MapHub<ProgramHub>("/programhub"); // Зареєструвати хаб на певному маршруті
            });

        }
    }
}
