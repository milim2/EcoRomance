using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project5
{
    public class CartItem
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public int Price { get; set; }
        public int Quantity { get; set; }

        public CartItem()
        {

        }

        public CartItem(int ID, string Name, string Image, string Description, int Price, int Quantity)
        {
            this.ID = ID;
            this.Name = Name;
            this.Image = Image;
            this.Description = Description;
            this.Price = Price;
            this.Quantity = Quantity;
        }
    }
}