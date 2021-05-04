Category.seed(:id,
# parent
{:id=>1, :name=>"芸能人", :ancestry=>nil},
{:id=>2, :name=>"テレビ、ラジオ", :ancestry=>nil},
{:id=>3, :name=>"趣味", :ancestry=>nil},
{:id=>4, :name=>"本、雑誌", :ancestry=>nil},
{:id=>5, :name=>"食事", :ancestry=>nil},
{:id=>6, :name=>"暮らし、生活", :ancestry=>nil},
{:id=>7, :name=>"住宅", :ancestry=>nil},
{:id=>8, :name=>"音楽", :ancestry=>nil},
{:id=>9, :name=>"健康", :ancestry=>nil},
{:id=>10, :name=>"美容、コスメ", :ancestry=>nil},
{:id=>11, :name=>"ファッション", :ancestry=>nil},
{:id=>12, :name=>"恋愛、人間関係、人生", :ancestry=>nil},
{:id=>13, :name=>"施設", :ancestry=>nil},
{:id=>14, :name=>"病院、病気", :ancestry=>nil},
{:id=>15, :name=>"マナー", :ancestry=>nil},
{:id=>16, :name=>"行事、冠婚葬祭", :ancestry=>nil},
{:id=>17, :name=>"子育て、学校", :ancestry=>nil},
{:id=>18, :name=>"受験、進学、留学", :ancestry=>nil},
{:id=>19, :name=>"インターネット、通信", :ancestry=>nil},
{:id=>20, :name=>"スマホ、PC、家電", :ancestry=>nil},
{:id=>21, :name=>"テクノロジー", :ancestry=>nil},
{:id=>22, :name=>"教養、学問", :ancestry=>nil},
{:id=>23, :name=>"ビジネス、経済、お金", :ancestry=>nil},
{:id=>24, :name=>"ニュース、時事、政治", :ancestry=>nil},
{:id=>25, :name=>"キャリア、仕事", :ancestry=>nil},
{:id=>26, :name=>"スポーツ、アウトドア", :ancestry=>nil},
{:id=>27, :name=>"旅行", :ancestry=>nil},
{:id=>28, :name=>"地域、交通", :ancestry=>nil},
{:id=>29, :name=>"公営ギャンブル", :ancestry=>nil},
{:id=>30, :name=>"その他", :ancestry=>nil},
# children(芸能人)
{:id=>31, :name=>"芸能人", :ancestry=>1},
{:id=>32, :name=>"話題の人", :ancestry=>1},
{:id=>33, :name=>"俳優・女優", :ancestry=>1},
{:id=>34, :name=>"アイドル", :ancestry=>1},
{:id=>35, :name=>"ミュージシャン", :ancestry=>1},
{:id=>36, :name=>"お笑い芸人", :ancestry=>1},
{:id=>37, :name=>"タレント", :ancestry=>1},
{:id=>38, :name=>"宝塚", :ancestry=>1},
{:id=>39, :name=>"劇団四季", :ancestry=>1},
{:id=>40, :name=>"声優", :ancestry=>1},
{:id=>41, :name=>"その他", :ancestry=>1},
# children(テレビ・ラジオ)
{:id=>42, :name=>"CM", :ancestry=>2},
{:id=>43, :name=>"ドラマ", :ancestry=>2},
{:id=>44, :name=>"バラエティ", :ancestry=>2},
{:id=>45, :name=>"情報番組", :ancestry=>2},
{:id=>46, :name=>"ラジオ", :ancestry=>2},
{:id=>47, :name=>"その他", :ancestry=>2},
# children(趣味)
{:id=>48, :name=>"邦画", :ancestry=>3},
{:id=>49, :name=>"洋画", :ancestry=>3},
{:id=>50, :name=>"アニメ", :ancestry=>3},
{:id=>51, :name=>"コミック", :ancestry=>3},
{:id=>52, :name=>"コスプレ", :ancestry=>3},
{:id=>53, :name=>"ゲーム", :ancestry=>3},
{:id=>54, :name=>"オンラインゲーム", :ancestry=>3},
{:id=>55, :name=>"ダンス", :ancestry=>3},
{:id=>56, :name=>"絵画", :ancestry=>3},
{:id=>57, :name=>"美術・工芸", :ancestry=>3},
{:id=>58, :name=>"鉄道", :ancestry=>3},
{:id=>59, :name=>"サバイバルゲーム", :ancestry=>3},
{:id=>60, :name=>"バレエ", :ancestry=>3},
{:id=>61, :name=>"写真", :ancestry=>3},
{:id=>62, :name=>"プラモデル", :ancestry=>3},
{:id=>63, :name=>"マジック", :ancestry=>3},
{:id=>64, :name=>"パチンコ・スロット", :ancestry=>3},
{:id=>65, :name=>"麻雀", :ancestry=>3},
{:id=>66, :name=>"囲碁・将棋", :ancestry=>3},
{:id=>67, :name=>"占い", :ancestry=>3},
{:id=>68, :name=>"その他", :ancestry=>3},
# children(本」、雑誌)
{:id=>69, :name=>"気になる本", :ancestry=>4},
{:id=>70, :name=>"ビジネス書", :ancestry=>4},
{:id=>71, :name=>"ライトノベル", :ancestry=>4},
{:id=>72, :name=>"読書", :ancestry=>4},
{:id=>73, :name=>"小説", :ancestry=>4},
{:id=>74, :name=>"雑誌", :ancestry=>4},
{:id=>75, :name=>"その他", :ancestry=>4}
)