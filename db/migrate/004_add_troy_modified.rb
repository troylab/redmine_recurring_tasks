class AddTroyModified < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def change
    change_table :recurring_tasks do |t|
      t.boolean :child_of_original, default: false #新建立的項目是否為原項目的子項目
      t.boolean :use_seq, default: false #是否啟動自動編號
      t.integer :seq_no_start, default: 1 #序號啟始值
      t.string :seq_prefix , default: "" #序號prefix
   end
  end
end