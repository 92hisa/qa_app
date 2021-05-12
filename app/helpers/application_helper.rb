module ApplicationHelper
  def default_meta_tags
    {
      site: 'その疑問、経験者に聞いてみよう。自由に経験者に質問ができるコミュニティサイト',
      title: 'Keiken',
      reverse: true,
      charset: 'utf-8',
      description: '身近にいない○○経験者。そんなときはKeikenで質問してみましょう。経験者があなたの質問に答えてくれるだけでなく、実際の経験エピソードも教えてくれます。',
      keywords: '経験者, 体験談, エピソード, 相談, 悩み, 心配, 経験者に聞く',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('apple-touch-icon-180x180'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: 'Keiken', # もしくは site_name: :site
        title: '【Keiken】その疑問、経験者に聞こう', # もしくは title: :title
        description: '身近にいない○○経験者。そんなときはKeikenで質問してみましょう。経験者があなたの質問に答えてくれるだけでなく、実際の経験エピソードも教えてくれます。', # もしくは description: :description
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      # twitter: {
      #   card: 'summary',
      #   site: '@ツイッターのアカウント名',
      # }
    }
  end
end
