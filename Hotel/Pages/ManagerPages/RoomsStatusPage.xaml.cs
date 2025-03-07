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
    /// Interaction logic for RoomsStatusPage.xaml
    /// </summary>
    public partial class RoomsStatusPage : Page
    {
        public RoomsStatusPage()
        {
            InitializeComponent();
            dgrRoomsStatus.ItemsSource = DbConnect.entObj.Rooms.ToList();
            cmbFloorNumber.SelectedValuePath = "floorNumber";
            cmbFloorNumber.DisplayMemberPath = "floorNumber";
            cmbFloorNumber.ItemsSource = DbConnect.entObj.Rooms.GroupBy(x => x.floorNumber).ToList();
            cmbFloorNumber.SelectedIndex = 0;
        }

        private void ApplyFilter()
        {
            int a = Convert.ToInt32(cmbFloorNumber.SelectedValue);
            var query = DbConnect.entObj.Rooms.AsQueryable();
            query = query.Where(x => x.floorNumber == a);
            dgrRoomsStatus.ItemsSource = query.ToList();
        }

        private void cmbFloorNumber_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyFilter();
        }

        private void dgrRoomsStatus_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (dgrRoomsStatus.SelectedItem != null)
            {
                var NewRoom = dgrRoomsStatus.SelectedItem;
                this.NavigationService.Navigate(new RoomRegistrationPage(NewRoom));
            }
        }
    }
}
