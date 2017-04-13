ActiveAdmin.register Customer do
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
permit_params :name, :password_digest, :province_id

filter :name
filter :created_at

index do
  selectable_column
  id_column
  column :name
  column :created_at
  actions
end

show :title => :name do
  panel "Order History" do
    table_for customer.orders do
      column("Order", :sortable => :id) {|order| link_to "##{order.id}", admin_order_path(order) }
      column("Status")                  {|order| status_tag(order.status.name) }
      column("Date", :sortable => :created_at){|order| pretty_format(order.created_at) }
      column("Total")                   {|order| number_to_currency order.total}
      column("Stripe Reference")        {|order| order.stripe }
    end
  end
end


sidebar "Customer Details", :only => :show do
  attributes_table_for customer, :name, :created_at
  attributes_table_for customer.addresses, :firstname, :lastname, :address, :city,:province,:city, :country
end

sidebar "Order History", :only => :show do
  attributes_table_for customer do
    row("Total Orders") { customer.orders.count }
    row("Total Value") { number_to_currency customer.orders.sum(:total) }
  end
end

end
