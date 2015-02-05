using KonverteraTemperaturer.Model;
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
            if (IsValid)
            {
                int startTemp = int.Parse(StartTempBox.Text);
                int finalTemp = int.Parse(EndTempTextBox.Text);
                int stepTemp = int.Parse(TempStepBox.Text);

                if (!CelToFarButton.Checked) //Beroende på vilken av radioknapparna som är aktiv kommer man antigen beräkna farenheit till cels eller vise versa.
                {
                    Left.Text = "&deg;F";
                    Right.Text = "&deg;C";
                }

                for (; startTemp <= finalTemp; startTemp += stepTemp)
                {
                    TableRow trow = new TableRow();
                    Table1.Rows.Add(trow);

                    TableCell tcell = new TableCell();
                    TableCell tcell2 = new TableCell();
                    trow.Cells.Add(tcell);
                    trow.Cells.Add(tcell2);

                    tcell.Text = startTemp.ToString();
                    //tcell2.Text = CelToFarButton.Checked ? TemperatureConverter.CelsiusToFarenheit(startTemp).ToString() :
                    //    TemperatureConverter.FarenheitToCelsius(startTemp).ToString();

                    if (CelToFarButton.Checked)
                    {
                        tcell2.Text = TemperatureConverter.CelsiusToFarenheit(startTemp).ToString();
                    }
                    else
                    {
                        tcell2.Text = TemperatureConverter.FarenheitToCelsius(startTemp).ToString();
                    }
                }

                Table1.Visible = true;
            }
        }

        protected void CalculateButton_Click_ORGINAL(object sender, EventArgs e)
        {
            if (IsValid)
            {
                //Nu så, här ska vi kolla textbox värderna och beroende på dom göra olika saker BEROENDE PÅ
                //Vad som Radioknappen säger. Efter detta ska det skickas en förfrågan till "TemperatureConverter
                //Med hur det ska konverteras. Cel till Far eller vise versa....
                // När ett svar har retunerats ska man generera ut ett table tills alla steg är slut ex.
                // 0 - 100 grader , 10 grader steg = 10 steg = 10 tabeller!
                int StartTemp = int.Parse(StartTempBox.Text);
                int FinalTemp = int.Parse(EndTempTextBox.Text);
                int StepTemp = int.Parse(TempStepBox.Text);
                /*
                int RowCount = 2;       // Antal Kolumner 
                int RowCounter;     // Antal kolumner som ska genereras ut
                int CellCount;      // Antal Celler
                int CellCounter;    // Antal Celler som ska genereras ut
                */

                if (CelToFarButton.Checked == true) //Beroende på vilken av radioknapparna som är aktiv kommer man antigen beräkna farenheit till cels eller vise versa.
                {
                    /*int StartTemp = int.Parse(StartTempBox.Text);
                    int FinalTemp = int.Parse(EndTempTextBox.Text);
                    int StepTemp = int.Parse(TempStepBox.Text);*/

                    //Skicka med parametren på talet som ska göras om, i detta fall ska Startsumman , slutsumman och
                    //Hur stora steg skickas med , samma gäller den nedan.                        
                    for (int i = StartTemp; i <= FinalTemp; i += StepTemp)
                    {
                        int CelToFar = TemperatureConverter.CelsiusToFarenheit(StartTemp);
                        TableRow trow = new TableRow();
                        TableCell tcell = new TableCell();
                        TableCell tcell2 = new TableCell();
                        Table1.Rows.Add(trow);
                        trow.Cells.Add(tcell);
                        trow.Cells.Add(tcell2);

                        tcell.Text = StartTemp.ToString();
                        tcell2.Text = CelToFar.ToString();




                        //Generera ut 2 kolumner Varav vänstra = Celcius /Högra = Farenheit
                        //så länge som startemp är mindre än sluttemp
                        //Skriv ut varje gång som tempen koverteras till farenheit 
                        //Genom att Vänstra cellen = Starttemp / i Högra cellen = CellToFar




                        StartTemp += StepTemp;
                    }
                    TableRow HeaderRow = new TableRow();
                    TableHeaderCell ThCell1 = new TableHeaderCell();
                    TableHeaderCell ThCell2 = new TableHeaderCell();

                    HeaderRow.Cells.Add(ThCell1);
                    HeaderRow.Cells.Add(ThCell2);

                    Table1.Rows.AddAt(0, HeaderRow);

                    if (CelToFarButton.Checked)
                    {
                        ThCell1.Text = "C";
                        ThCell2.Text = "F";
                    }
                    else
                    {
                        ThCell1.Text = "F";
                        ThCell2.Text = "C";
                    }
                    Table1.Visible = true;
                }
                else
                {
                    /*int StartTemp = int.Parse(StartTempBox.Text);
                    int FinalTemp = int.Parse(EndTempTextBox.Text);
                    int StepTemp = int.Parse(TempStepBox.Text);*/


                    for (int i = StartTemp; i <= FinalTemp; i += StepTemp)
                    {
                        int FarToCel = TemperatureConverter.FarenheitToCelsius(StartTemp);
                        TableRow trow = new TableRow();
                        TableCell tcell = new TableCell();
                        TableCell tcell2 = new TableCell();
                        Table1.Rows.Add(trow);
                        trow.Cells.Add(tcell);
                        trow.Cells.Add(tcell2);

                        tcell.Text = StartTemp.ToString();
                        tcell2.Text = FarToCel.ToString();

                        StartTemp += StepTemp;
                    }
                    TableRow HeaderRow = new TableRow();
                    TableHeaderCell ThCell1 = new TableHeaderCell();
                    TableHeaderCell ThCell2 = new TableHeaderCell();

                    HeaderRow.Cells.Add(ThCell1);
                    HeaderRow.Cells.Add(ThCell2);

                    Table1.Rows.AddAt(0, HeaderRow);

                    if (FarToCelButton.Checked)
                    {
                        ThCell1.Text = "F";
                        ThCell2.Text = "C";
                    }
                    else
                    {
                        ThCell1.Text = "C";
                        ThCell2.Text = "F";
                    }

                    Table1.Visible = true;
                }
            }
        }
    }
}