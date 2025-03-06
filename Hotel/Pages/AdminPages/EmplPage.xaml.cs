using Hotel.MainClasses;
using Hotel.Res;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Hotel.Pages.AdminPages
{
    /// <summary>
    /// Логика взаимодействия для EmplPage.xaml
    /// </summary>
    public partial class EmplPage : Page
    {
        private Usr EmplObj;
        public EmplPage()
        {
            InitializeComponent();
            dgrEmployee.ItemsSource = DbConnect.entObj.Usrs.ToList();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AdminPage());
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if(dgrEmployee.SelectedItem != null)
            {
                var mid = TypeDescriptor.GetProperties(dgrEmployee.SelectedItem)["id"].GetValue(dgrEmployee.SelectedItem);
                EmplObj = DbConnect.entObj.Usrs.FirstOrDefault(a => a.id == (int)mid);
                DbConnect.entObj.Usrs.Remove(EmplObj);
                DbConnect.entObj.SaveChanges();
                dgrEmployee.ItemsSource = DbConnect.entObj.Usrs.ToList();
            }
        }

        private void dgrEmployee_CurrentCellChanged(object sender, EventArgs e)
        {
            Delete.Visibility = Visibility.Visible;
        }

        private void dgrEmployee_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgrEmployee.SelectedItem != null)
            {
                var imp = dgrEmployee.SelectedItem;
                this.NavigationService.Navigate(new EditEmployeePage(imp));
            }
        }

        private void Reg_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new RegEmpPage());
        }
    }
}
