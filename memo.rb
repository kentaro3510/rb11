require "csv"
require "readline"
 
    puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
    memo_type = gets.to_s.chomp
    
    puts "あなたは" + memo_type + "を入力しました"
    
    if memo_type === "1"
        
        puts "拡張子を除いたファイル名を入力してください"
        memo_name = gets
        puts "メモしたい内容を記入してください\nCtrl + Dで終了してください"
        memo_contents = readlines(chomp: true)
        memo = CSV.open(memo_name + ".csv","w")
        memo.puts memo_contents
        
    elsif  memo_type === "2"
        
        Dir.glob('*?.csv') do |d|
          puts d
        end
        puts "編集するファイル名を拡張子を除いて入力してください"
        memo_name = gets
        memo = CSV.read(memo_name + ".csv")
        puts "メモの内容は\n#{memo}です\n1(追記する) 2(削除する) 3(編集せずに終了する)"
        
        edit_type = gets.to_s.chomp
        if edit_type === "1"
            puts "追記したい内容を記入してください\nCtrl + Dで終了してください"
            memo_contents = readlines(chomp: true)
            memo = CSV.open(memo_name + ".csv","a")
            memo.puts memo_contents
            puts "編集が完了いたしました"
            
        elsif edit_type === "2"
            puts "削除したい配列の番号を記入してください\n例　[a], [b], [c]\n1\n[b],[c]"
            arrangement_type = gets.chomp.to_i
            memo_contents = CSV.read(memo_name + ".csv")
            memo_contents.delete_at(arrangement_type - 1)
            memo = CSV.open(memo_name + ".csv","w")
            memo.puts memo_contents

        elsif edit_type === "3"
            puts "操作を終了いたします"
        else
            puts "正しい数字を入力してください"
        end
    else
        puts "正しい数字を入力してください"
    end