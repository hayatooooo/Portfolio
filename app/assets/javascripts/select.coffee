#coffeescriptは最近はあまり使わないらしい
$(document).on "turbolinks:load", -> 
  do ->
    replaceSelectOptions = ($select, results) ->
      #いったん空の選択肢を追加したあと、サーバーから受け取った値を設定
      $select.html $("<option>")
      $.each results, ->
        option = $("<option>").val(this.id).text(this.name)
        $select.append(option)

    replaceChildrenOptions = ->
      # 選択された親カテゴリのオプションから、data-children-pathの値を読み取る
      childrenPath = $(@).find("option:selected").data().childrenPath
      # 子カテゴリのセレクトボックスを取得する
      $selectChildren = $(@).closest("form").find(".select-children")
      if childrenPath?
        # childrenPathが存在する = 親カテゴリが選択されている場合、
        # ajaxでサーバーに子カテゴリの一覧を問い合わせる
        $.ajax
          url: childrenPath
          dataType: "json"
          success: (results) ->
            # サーバーから受け取った子カテゴリの一覧でセレクトボックスを置き換える
            replaceSelectOptions($selectChildren, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
            console.error("Error occurred in replaceChildrenOptions")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        # 親カテゴリが未選択時、子カテゴリの選択肢をクリア
        replaceSelectOptions($selectChildren, [])

    #親カテゴリ変更時
    $(document).on "turbolinks:load",$(".select-parent").on
      "change": replaceChildrenOptions