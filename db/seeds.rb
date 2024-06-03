User.create!(email: 'admin@admin.com', first_name: 'admin', last_name: 'admin', role: :admin, password: 'admin1234', password_confirmation: 'admin1234')
Product.create!(
  [
    {title: 'Producto 1', price: 10000, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 12},
    {title: 'Producto 2', price: 15000, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 44},
    {title: 'Producto 3', price: 13000, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 54},
    {title: 'Producto 4', price: 6000, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 100},
    {title: 'Producto 5', price: 7657, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 342},
    {title: 'Producto 6', price: 23534, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 434},
    {title: 'Producto 7', price: 43242, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 43},
    {title: 'Producto 8', price: 444, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 12},
    {title: 'Producto 9', price: 54354, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 33},
    {title: 'Producto 10', price: 423, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 3},
    {title: 'Producto 11', price: 43242, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 2},
    {title: 'Producto 12', price: 1700, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 44},
    {title: 'Producto 13', price: 4353, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 1},
    {title: 'Producto 14', price: 444, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 45},
    {title: 'Producto 15', price: 42343, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 55},
    {title: 'Producto 16', price: 5555, description: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC', stock: 55},
  ]
)
