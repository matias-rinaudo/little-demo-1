module Orders
  class GeneratePdf
    LOGO_IMG = 'app/assets/images/logo.jpg'

    def initialize(args={})
      @order = args[:order]
      @pdf = Prawn::Document.new
      @document_width = @pdf.bounds.width
    end

    def call
      header
      details
      items
      @pdf.render
    end

    private

    def header
      header_column_widths = [@document_width * 1 / 4, @document_width * 1 / 5]
      table = [
                [
                  {:image => LOGO_IMG, scale: 0.5, colspan: 6}
                ] 
              ]
      header_logo_options = {
        column_widths: header_column_widths,
        row_colors: ['FFFFFF'],
        cell_style: {
          border_width: 0,
          padding: [20, 1, 5, 10],
          borders: [:bottom],
          border_color: 'FFFFFF',
          text_color: '3b3a30'
        }
      }

      @pdf.table(table, header_logo_options)
    end

    def details
      data = [
        ["ID:         #{@order.id}"],
        ["Comprador:     #{@order.customer.full_name}"],
        ["Fecha de vta:  #{@order.created_at.strftime("%d/%m/%Y")}"],
        ["Importe:    $ #{@order.total.to_s}"]
      ]

      data_options = {
       width: @document_width,
       row_colors: ['FFFFFF'],
       cell_style: {
        border_width: 1,
        border_color: 'c9ced5',
        padding: [1, 10]
       }
      }

      @pdf.table([['']], :cell_style => {border_width: 0, border_color: 'c9ced5'})
      @pdf.table([['']], :cell_style => {border_width: 0, border_color: 'c9ced5'})
      @pdf.table(data, data_options)
    end

    def items
      data_item = []

      if @order.line_items.any?
        @order.line_items.map do |item|
          data_item << [
                        " 
                          Producto: #{item.product.title}
                          Cantidad: #{item.quantity}
                          Total: $ #{item.total_price.to_f}
                        "
                        ]
        end
      else
        data_item << ['--']   
      end
     
      options = {
       width: @document_width,
       row_colors: ['FFFFFF'],
       cell_style: {
        border_width: 0,
        borders: [:bottom],
        border_color: 'c9ced5',
        padding: [1, 10]
       }
      }

      @pdf.table([['']], :cell_style => {border_width: 0, border_color: 'c9ced5'})
      @pdf.table(data_item, options)
    end
  end
end