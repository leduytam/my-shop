using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace MyShop.Ultils
{
    public class MultiPasswordBoxConverter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            // Convert the password values to the appropriate type for your command's parameter
            // In this example, we concatenate the two password values as a string
            string password1 = values[0] as string;
            string password2 = values[1] as string;
            string combinedPasswords = $"{password1},{password2}";

            return combinedPasswords;
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            // Implement if needed
            throw new NotImplementedException();
        }
    }
}
