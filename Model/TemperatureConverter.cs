using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KonverteraTemperaturer.Model
{
    public static class TemperatureConverter
    {
       public static int CelsiusToFarenheit(int degreesC)
        {
          
           
            return(int)Math.Round(degreesC * 1.8 + 32);
            //Cel -> Far [°F] = [°C] ∙ 1,8 + 32
        }

        public static int FarenheitToCelsius(int degreesF)
        {

            // Far -> Cel [°C] = ([°F] − 32) ∙ 5 / 9
            
            return (int)Math.Round((degreesF - 32) * 5 / 9d);
        } 
        
        
        
    }
}