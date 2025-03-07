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

namespace Hotel.Pages.ManagerPages
{
    /// <summary>
    /// Interaction logic for RoomRegistrationPage.xaml
    /// </summary>
    public partial class RoomRegistrationPage : Page
    {
        ClientRoom NewGuest;
        public RoomRegistrationPage(object NewRoom)
        {
            InitializeComponent();
            DataContext = NewRoom;
            var mid = TypeDescriptor.GetProperties(DataContext)["id"].GetValue(DataContext);
            NewGuest = DbConnect.entObj.ClientRooms.FirstOrDefault(x => x.id == (int)mid);

            Categ.Content = NewGuest.Room.Category.categoryName;
            RomNum.Content = NewGuest.Room.roomNumber;
            cmbClientName.SelectedValuePath = "Client.clientName";
            cmbClientName.DisplayMemberPath = "Client.clientName";
            cmbClientName.ItemsSource = DbConnect.entObj.ClientRooms.ToList();
        }

        private void dpDateIn_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if(dpDateIn.SelectedDate < DateTime.Now)
            {
                MessageBox.Show("Нельзя забронировать на прошлое!", "Неверная дата", MessageBoxButton.OK, MessageBoxImage.Warning);
                dpDateIn.SelectedDate = null;
            }
        }

        private void dpDateOut_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            if (dpDateOut.SelectedDate < DateTime.Now.AddDays(1))
            {
                MessageBox.Show("Нельзя выехать раньше!", "Неверная дата", MessageBoxButton.OK, MessageBoxImage.Warning);
                dpDateOut.SelectedDate = null;
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            
        }
    }
}