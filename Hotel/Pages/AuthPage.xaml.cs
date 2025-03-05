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

namespace Hotel.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        public AuthPage()
        {
            InitializeComponent();
            var user = DbConnect.entObj.Usr.FirstOrDefault(x => x.login == log.Text && x.passwd == passwd.Password);
            if (user != null)
            {
                RoleClass.RoleName = user.Role.roleName;
                if (RoleClass.RoleName == "Admin") this.NavigationService.Navigate(new AdminPages.AdminPage());
                if (RoleClass.RoleName == "Manager") this.NavigationService.Navigate(new ManagerPages.ManagerPage());
            }
            else wrong.Content = "Неверный логин или пароль";
        }
    }
}
