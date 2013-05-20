
class SvaPersonalPbvTbl < ActiveRecord::Migration
  def change
    create_table :sva_personal_pbv_tbl do |t|
      t.integer  :pbv_pgd_join_id, null: false
      t.integer  :pbv_nr, null: false
      t.string   :pbv_dienstart, null: false
      t.string   :pbv_flag, null: true
      t.string   :pbv_lehrende, null: true

      t.timestamps
    end

    add_index(:sva_personal_pbv_tbl, :pbv_pgd_join_id, name: 'sva_personal_pbv_idx1')
    add_index(:sva_personal_pbv_tbl, :pbv_dienstart, name: 'sva_personal_pbv_idx2')
    add_index(:sva_personal_pbv_tbl, :pbv_lehrende, name: 'sva_personal_pbv_idx3')
    add_index(:sva_personal_pbv_tbl, :pbv_nr, name: 'sva_personal_pbv_idx4')
  end
end
