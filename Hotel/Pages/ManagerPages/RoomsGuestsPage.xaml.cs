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
    /// Interaction logic for RoomsGuestsPage.xaml
    /// </summary>
    public partial class RoomsGuestsPage : Page
    {
        public RoomsGuestsPage()
        {
            InitializeComponent();
            dgrRoomsGuests.ItemsSource = DbConnect.entObj.ClientRooms.ToList();
            cmbFloorNumber.SelectedValuePath = "floorNumber";
            cmbFloorNumber.DisplayMemberPath = "floorNumber";
            cmbFloorNumber.ItemsSource = DbConnect.entObj.Rooms.GroupBy(x=>x.floorNumber).ToList();
            cmbFloorNumber.SelectedIndex = 0;
        }

        private void ApplyFilter()
        {
            int a = Convert.ToInt32(cmbFloorNumber.SelectedValue);
            var query = DbConnect.entObj.ClientRooms.AsQueryable();
            query = query.Where(x => x.Room.floorNumber == a);
            dgrRoomsGuests.ItemsSource = query.ToList();
        }

        private void cmbFloorNumber_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyFilter();
        }
    }
}
