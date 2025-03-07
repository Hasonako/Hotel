using Hotel.MainClasses;
using System;
using System.Collections.Generic;
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

namespace Hotel.Pages.ManagerPages
{
    /// <summary>
    /// Interaction logic for ManagerPage.xaml
    /// </summary>
    public partial class ManagerPage : Page
    {
        public ManagerPage()
        {
            InitializeComponent();
            if (RoleClass.RoleName == "Admin") LogOut.Visibility = Visibility.Hidden;
            Rooms.Navigate(new RoomsPage());
            RoomsStatus.Navigate(new RoomsStatusPage());
            RoomsGuests.Navigate(new RoomsGuestsPage());
        }

        private void LogOut_Click(object sender, RoutedEventArgs e)
        {
            RoleClass.RoleName = "";
            this.NavigationService.Navigate(new AuthPage());
        }

        private void RegGuest_Click(object sender, RoutedEventArgs e)
        {
            //if(dgr)
        }
    }
}
