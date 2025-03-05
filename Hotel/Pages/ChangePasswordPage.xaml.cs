using Hotel.MainClasses;
using Hotel.Res;
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
    /// Interaction logic for ChangePasswordPage.xaml
    /// </summary>
    public partial class ChangePasswordPage : Page
    {
        Usr TheUser;
        public ChangePasswordPage()
        {
            InitializeComponent();
            Welcome.Content = RoleClass.UsrName;
            var user = DbConnect.entObj.Usrs.FirstOrDefault(x => x.id == RoleClass.UsrId);
            TheUser = user;
        }

        private void Change_Click(object sender, RoutedEventArgs e)
        {
            if (NewPasswd.Password == "" || NewPasswdAgain.Password == "")
            {
                MessageBox.Show("Введите данные", "Пустые поля", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (NewPasswd.Password == NewPasswdAgain.Password)
            {
                if (TheUser.passwd == CurrentPasswd.Password)
                {
                    try
                    {
                        TheUser.id = RoleClass.UsrId;
                        TheUser.passwd = NewPasswd.Password;
                        TheUser.lastLogDate = DateTime.Now;
                        TheUser.FirstLogin = false;
                        DbConnect.entObj.SaveChanges();
                        MessageBox.Show("Пароль успешно изменен.\nАвторизуйтесь снова.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                        this.NavigationService.Navigate(new AuthPage());
                    }
                    catch
                    {

                    }
                }
                else MessageBox.Show("Введен неверный пароль", "Неверные данные", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else MessageBox.Show("Введенные пароль не совпадают", "Неверные данные", MessageBoxButton.OK, MessageBoxImage.Warning);
        }
    }
}
