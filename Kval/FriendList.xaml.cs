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

namespace Kval
{
    /// <summary>
    /// Логика взаимодействия для FriendList.xaml
    /// </summary>
    public partial class FriendList : Page
    {
        public FriendList()
        {
            InitializeComponent();
            DGridFriends.ItemsSource =FriendsBaseEntities.GetContext().Friends.ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Uri addFriends = new Uri("AddFriends.xaml", UriKind.Relative);
            this.NavigationService.Navigate(addFriends);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Uri back = new Uri("MainMenu.xaml", UriKind.Relative);
            this.NavigationService.Navigate(back);
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var sfriendsForRemoving = DGridFriends.SelectedItems.Cast<Friends>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить следующие {sfriendsForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    FriendsBaseEntities.GetContext().Friends.RemoveRange(sfriendsForRemoving);
                    FriendsBaseEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены");

                    DGridFriends.ItemsSource = FriendsBaseEntities.GetContext().Friends.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }



   
}
