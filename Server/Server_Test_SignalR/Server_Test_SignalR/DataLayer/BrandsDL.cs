using Microsoft.Data.SqlClient;
using Server_Test_SignalR.Entieis;
using System.Data;

namespace Server_Test_SignalR.DataLayer
{
    public class BrandsDL
    {
        public string ConnectionString = "Data Source=DESKTOP-ENJOGM8;Initial Catalog=INT20DB;Integrated Security=True; TrustServerCertificate=True";

        public async Task<List<String>> GetAllBrandsAsync()
        {
            List<String> brands = new List<String>();

            try
            {
                using (SqlConnection conn = new SqlConnection(ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetAllBrands", conn))
                    {
                        conn.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (SqlDataReader reader = await cmd.ExecuteReaderAsync())
                        {
                            while (reader.Read())
                            {
                                String lBrand = reader.GetString(reader.GetOrdinal("BrandName"));
                                brands.Add(lBrand);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"An error occurred: {ex.Message}");
            }

            return brands;
        }
    }
}
