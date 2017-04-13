ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
permit_params :total, :status_id, :customer_id

  filter :price
  filter :created_at

  index do
  column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
  column("Status")                   {|order| status_tag(order.status.name) }
  column("Date", :created_at)
  column("Customer", :customer, :sortable => :customer_id)
  column("Total")                   {|order| number_to_currency order.total }
  end


  show do
    panel "Invoice" do
      table_for order.line_item do |t|
        t.column("Product") {|item| auto_link item.product        }
        t.column("Price")   {|item| number_to_currency item.price }
        t.column("Quantity")   {|item| item.quantity }
        t.column("Total")   {|item| number_to_currency item.quantity * item.price }
        tr do
        td "Total:", :style => "text-align: right;"
        td number_to_currency(order.total)
        end
      end
    end
  end

  sidebar :customer_information, :only => :show do
    attributes_table_for order.customer do
      row("Customer") { auto_link order.customer }
      row :name
    end
  end





end
