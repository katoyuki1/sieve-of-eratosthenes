class Eratos
  def sieve_of_eratos(number)
    # 探索リスト
    search_list = []
    # 素数リスト
    prime_num_list = []
    # 2から引数の値を探索リストに追加
    for search_num in 2..number do
      search_list << search_num
    end

    # 引数numberの平方根
    square_root = number**(1/2.0)

    for num in search_list do
      # 先頭要素を取得。deleteメソッドによってポインタがずれるため。
      num = search_list.first
      # 探索リストの先頭値がnumberの平方根に達したらループから抜ける
      if num > square_root
        break
      end

      # 探索リストの値を素数リストに追加
      prime_num_list << num
      for baisu in num..number do
        # numの倍数を探索リストから削除
        if baisu % num == 0
          search_list.delete(baisu)
        end
      end
    end
    # 探索リストに残った数を素数リストに移動
    for num in search_list do
      prime_num_list << num
    end
    # 素数を出力
    puts prime_num_list.join(", ")
  end
end

eratos = Eratos.new
eratos.sieve_of_eratos(ARGV[0].to_i)
