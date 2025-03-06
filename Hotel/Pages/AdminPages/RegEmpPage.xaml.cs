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
    /// Interaction logic for RegEmpPage.xaml
    /// </summary>
    public partial class RegEmpPage : Page
    {
        public RegEmpPage()
        {
            InitializeComponent();
            CmbRole.SelectedValuePath = "Role.roleName";
            CmbRole.DisplayMemberPath = "Role.roleName";
            CmbRole.ItemsSource = DbConnect.entObj.Usr.GroupBy(x => x.Role.roleName).ToList();
        }

        private void Reg_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if(DbConnect.entObj.Usr.FirstOrDefault(x=>x.login == txbLog.Text) != null)
                {
                    MessageBox.Show("Пользователь с данным логином уже существует.","Пользователь уже существует", MessageBoxButton.OK,MessageBoxImage.Warning);
                }
                else
                {
                    if(txbLog.Text == "" || txbName.Text == "" || pswdbxPasswd.Password == "")
                    {
                        MessageBox.Show("Заполните данные", "Пустые поля", MessageBoxButton.OK, MessageBoxImage.Warning);
                    }
                    else {
                        var RoleName = DbConnect.entObj.Role.FirstOrDefault(x => x.roleName == CmbRole.Text);
                        var RoleId = TypeDescriptor.GetProperties(RoleName)["id"].GetValue(RoleName);

                        Usr NewUser = new Usr();
                        {
                            NewUser.name = txbName.Text;
                            NewUser.login = txbLog.Text;
                            NewUser.passwd = pswdbxPasswd.Password;
                            NewUser.roleId = (int)RoleId;
                            NewUser.lastLogDate = DateTime.Now;
                            NewUser.blockStatusId = 2;
                            NewUser.FirstLogin = true;
                        }
                        DbConnect.entObj.Usr.Add(NewUser);
                        DbConnect.entObj.SaveChanges();
                        MessageBox.Show("Пользователь " + NewUser.name + " добавлен.", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                        this.NavigationService.Navigate(new EmplPage());
                    }
                }
            }
            catch 
            { 
            
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
