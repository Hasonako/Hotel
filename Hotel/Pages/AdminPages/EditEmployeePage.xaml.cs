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
    /// Логика взаимодействия для EditEmployeePage.xaml
    /// </summary>
    public partial class EditEmployeePage : Page
    {
        private Usr EditUser;
        public EditEmployeePage(object imp)
        {
            InitializeComponent();
            var mid = TypeDescriptor.GetProperties(imp)["id"].GetValue(imp);
            EditUser = DbConnect.entObj.Usr.FirstOrDefault(x => x.id == (int)mid);

            txbName.Text = EditUser.name;
            txbLog.Text = EditUser.login;
            //Комбо Бокс с ролью
            CmbRole.SelectedValuePath = "roleName";
            CmbRole.DisplayMemberPath = "roleName";
            CmbRole.ItemsSource = DbConnect.entObj.Role.GroupBy(x => x.roleName).ToList();
            CmbRole.Text = EditUser.Role.roleName;
            //Комбо Бокс с блокировкой
            cmbBlock.SelectedValuePath = "blockStatus";
            cmbBlock.DisplayMemberPath = "blockStatus";
            cmbBlock.ItemsSource = DbConnect.entObj.AccStatus.GroupBy(x => x.blockStatus).ToList();
            cmbBlock.Text = EditUser.AccStatus.blockStatus;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txbName.Text == "" || txbLog.Text == "" || cmbBlock.Text == "" || CmbRole.Text == "")
                MessageBox.Show("Заполните поля!", "Пустые поля", MessageBoxButton.OK, MessageBoxImage.Warning);
            else
            {
                var RoleName = DbConnect.entObj.Role.FirstOrDefault(x => x.roleName == CmbRole.Text);
                var RoleId = TypeDescriptor.GetProperties(RoleName)["id"].GetValue(RoleName);

                var BlockStatusName = DbConnect.entObj.AccStatus.FirstOrDefault(x => x.blockStatus == cmbBlock.Text);
                var BlockId = TypeDescriptor.GetProperties(BlockStatusName)["id"].GetValue(BlockStatusName);

                EditUser.name = txbName.Text;
                EditUser.login = txbLog.Text;
                if (pswdbxPasswd.Password != "") EditUser.passwd = pswdbxPasswd.Password;
                EditUser.roleId = (int)RoleId;
                EditUser.blockStatusId = (int)BlockId;
                DbConnect.entObj.SaveChanges();
                MessageBox.Show("Данные изменены", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                this.NavigationService.Navigate(new EmplPage());
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
