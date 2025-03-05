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
            
        }

        private void LogIn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if(log.Text == "" || passwd.Password == "")
                {
                    MessageBox.Show("Пожалуйста, заполните поля логина и пароля", "Проверьте правильность введенный данных", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    var user = DbConnect.entObj.Usrs.FirstOrDefault(x => x.login == log.Text && x.passwd == passwd.Password);
                    if (user != null)
                    {
                        MessageBox.Show("Вы успешно авторизовались", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);

                        RoleClass.RoleName = user.Role.roleName;
                        RoleClass.UsrName = user.name;
                        RoleClass.UsrId = user.id;

                        if (user.FirstLogin == true) this.NavigationService.Navigate(new ChangePasswordPage());
                        else if (RoleClass.RoleName == "Admin") this.NavigationService.Navigate(new AdminPages.AdminPage());
                        else if (RoleClass.RoleName == "Manager") this.NavigationService.Navigate(new ManagerPages.ManagerPage());
                        else MessageBox.Show("Ты кто?", "Как ты сюда попал?", MessageBoxButton.OK, MessageBoxImage.Question);
                    }
                    else {
                        MessageBox.Show("Вы ввели неверный логин или пароль. Пожалуйста проверьте ещё раз введенные данные", "Проверьте правильность введенный данных", MessageBoxButton.OK, MessageBoxImage.Error);
                        wrong.Content = "Неверный логин или пароль";
                    }
                }
            }
            catch
            {

            }
        }
    }
}
