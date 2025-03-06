using Hotel.MainClasses;
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
    /// Interaction logic for RoomsPage.xaml
    /// </summary>
    public partial class RoomsPage : Page
    {
        public RoomsPage()
        {
            InitializeComponent();
            dgrRooms.ItemsSource = DbConnect.entObj.Rooms.ToList();
            //Комбобокс этаж
            cmbFloorNumber.SelectedValuePath = "floorNumber";
            cmbFloorNumber.DisplayMemberPath = "floorNumber";
            cmbFloorNumber.ItemsSource = DbConnect.entObj.Rooms.GroupBy(x => x.floorNumber).ToList();
            cmbFloorNumber.SelectedIndex = 0;
            //комбобокс категория
            cmbCategory.SelectedValuePath = "Category.categoryName";
            cmbCategory.DisplayMemberPath = "Category.categoryName";
            cmbCategory.ItemsSource = DbConnect.entObj.Rooms.GroupBy(x => x.Category.categoryName).ToList();
        }

        private void ApplyFilter()
        {
            var query = DbConnect.entObj.Rooms.AsQueryable();
            int a = Convert.ToInt32(cmbFloorNumber.SelectedValue);
            if (cmbCategory.SelectedValue != null)
            {
                var catName = DbConnect.entObj.Categories.FirstOrDefault(x => x.categoryName == (string)cmbCategory.SelectedValue);
                var catId = TypeDescriptor.GetProperties(catName)["id"].GetValue(catName);
                query = query.Where(x => x.floorNumber == a && x.categoryId == (int)catId);
            }
            else query = query.Where(x => x.floorNumber == a);

            dgrRooms.ItemsSource = query.ToList();
        }

        private void cmbFloorNumber_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ApplyFilter();
        }
    }
}
