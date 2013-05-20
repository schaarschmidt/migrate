
class SvaPersonalPgdTbl < ActiveRecord::Migration
  def change
    create_table :sva_personal_pgd_tbl do |t|
      t.integer  :pgd_join_id, null: false
      t.string   :pgd_name, null: false
      t.string   :pgd_vorname, null: false
      t.string   :pgd_titel, null: true
      t.date     :pgd_geburtsdatum, null: false
      t.string   :pgd_geschlecht, null: false
      t.date     :pgd_endedatum, null: true

      t.timestamps
    end

    add_index(:sva_personal_pgd_tbl, :pgd_join_id, unique: true, name: 'sva_personal_pgd_idx1')
    add_index(:sva_personal_pgd_tbl, [:pgd_name, :pgd_vorname, :pgd_geburtsdatum], unique: true, name: 'sva_personal_pgd_idx2')
    add_index(:sva_personal_pgd_tbl, :pgd_endedatum, name: 'sva_personal_pgd_idx3')
  end
end
