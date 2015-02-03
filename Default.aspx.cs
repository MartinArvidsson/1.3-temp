using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KonverteraTemperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CalculateButton_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                //Nu jävlar, här ska vi kolla textbox värderna och beroende på dom göra olika saker BEROENDE PÅ
                //Vad som Radioknappen säger. Efter detta ska det skickas en förfrågan till "TemperatureConverter
                //Med hur det ska konverteras. Cel till Far eller vise versa....
                // När ett svar har retunerats ska man generera ut ett table tills alla steg är slut ex.
                // 0 - 100 grader , 10 grader steg = 10 steg = 10 FANTASTISKA TABELLER!
            }
        }
    }
}