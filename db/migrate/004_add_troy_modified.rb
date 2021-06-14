class AddTroyModified < Rails.version < '5.0' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def change
    change_table :recurring_tasks do |t|
      t.datetime :schedule_start_at #schedule 啟動時間 (未到啟動時間的不會被執行)
      t.datetime :schedule_end_at #schedule 結束時間 (超過結束時間的不會被執行)
      t.integer  :time_zone_offset, default: 8 #8 表示 +8 taipei/asia
      t.integer :seq_no_start, default: 1 #序號啟始值
      t.string :seq_prefix #序號prefix
   end
  end
end