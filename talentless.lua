getgenv().translator = loadstring([=[local translator = {}

local translations = {
    ["play song"] = {
        ["en"] = "play song!",
        ["pt-BR"] = "tocar!",
        ["es"] = "canción",
        ["ru"] = "воспроизв.",
        ["zh-CN"] = "播放",
        ["id"] = "putar",
        ["fil"] = "kanta",
        ["vi"] = "phát",
        ["fr"] = "jouer",
        ["de"] = "abspielen",
        ["ja"] = "曲を再生",
        ["ko"] = "노래 재생",
        ["tr"] = "şarkıyı çal",
        ["ar"] = "تشغيل"
    },    

    ["search"] = {
        ["en"] = "search...",
        ["pt-BR"] = "procurar...",
        ["es"] = "buscar...",
        ["ru"] = "поиск...",
        ["zh-CN"] = "搜索...",
        ["id"] = "cari...",
        ["fil"] = "maghanap...",
        ["vi"] = "tìm kiếm...",
        ["fr"] = "rechercher...",
        ["de"] = "suchen...",
        ["ja"] = "検索...",
        ["ko"] = "검색...",
        ["tr"] = "ara...",
        ["ar"] = "بحث..."
    },

    ["songname"] = {
        ["en"] = "SONG NAME",
        ["pt-BR"] = "NOME DA MÚSICA",
        ["es"] = "NOMBRE DE LA CANCIÓN",
        ["ru"] = "НАЗВАНИЕ ПЕСНИ",
        ["zh-CN"] = "歌曲名称",
        ["id"] = "NAMA LAGU",
        ["fil"] = "PANGALAN NG KANTA",
        ["vi"] = "TÊN BÀI HÁT",
        ["fr"] = "NOM DE LA CHANSON",
        ["de"] = "LIEDNAME",
        ["ja"] = "曲名",
        ["ko"] = "노래 제목",
        ["tr"] = "ŞARKI ADI",
        ["ar"] = "اسم الأغنية"
    },

    ["toggle ui"] = {
        ["en"] = "toggle ui",
        ["pt-BR"] = "alternar ui",
        ["es"] = "alternar ui",
        ["ru"] = "переключить ui",
        ["zh-CN"] = "切换界面",
        ["id"] = "alih ui",
        ["fil"] = "i-toggle ui",
        ["vi"] = "chuyển ui",
        ["fr"] = "basculer ui",
        ["de"] = "ui umschalten",
        ["ja"] = "ui切替",
        ["ko"] = "ui 전환",
        ["tr"] = "ui değiştir",
        ["ar"] = "تبديل ui"
    },    

    ["spoof midi"] = {
        ["en"] = "spoof midi",
        ["pt-BR"] = "falsificar midi",
        ["es"] = "falsificar midi",
        ["ru"] = "подделать midi",
        ["zh-CN"] = "伪装 midi",
        ["id"] = "palsukan midi",
        ["fil"] = "peke ang midi",
        ["vi"] = "giả midi",
        ["fr"] = "simuler midi",
        ["de"] = "midi vortäuschen",
        ["ja"] = "midiを偽装",
        ["ko"] = "midi 스푸핑",
        ["tr"] = "midi sahteleme",
        ["ar"] = "تزييف midi"
    },

    ["shuffle play songs"] = {
        ["en"] = "SHUFFLE PLAY SONGS",
        ["pt-BR"] = "EMBARALHAR MÚSICAS",
        ["es"] = "MEZCLAR CANCIONES",
        ["ru"] = "СЛУЧАЙНЫЙ ПРОИГРЫВ",
        ["zh-CN"] = "随机播放歌曲",
        ["id"] = "ACAK PUTAR LAGU",
        ["fil"] = "I-SHUFFLE ANG MGA KANTA",
        ["vi"] = "PHÁT NGẪU NHIÊN",
        ["fr"] = "MÉLANGER LES CHANSONS",
        ["de"] = "LIEDER MISCHEN",
        ["ja"] = "曲をシャッフル",
        ["ko"] = "노래 섞어 재생",
        ["tr"] = "ŞARKILARI KARMA ÇAL",
        ["ar"] = "تشغيل الأغاني عشوائياً"
    },    
    
    ["play random song"] = {
        ["en"] = "PLAY A RANDOM SONG",
        ["pt-BR"] = "MÚSICA ALEATÓRIA",
        ["es"] = "CANCIÓN ALEATORIA",
        ["ru"] = "СЛУЧАЙНАЯ ПЕСНЯ",
        ["zh-CN"] = "播放随机歌曲",
        ["id"] = "ACAK PUTAR LAGU",
        ["fil"] = "I-RANDOM ANG KANTA",
        ["vi"] = "PHÁT BÀI NGẪU NHIÊN",
        ["fr"] = "CHACUN UNE CHANSON",
        ["de"] = "ZUFÄLLIGES LIED SPIELEN",
        ["ja"] = "ランダム再生",
        ["ko"] = "랜덤 노래 재생",
        ["tr"] = "RANDOM ŞARKI ÇAL",
        ["ar"] = "تشغيل أغنية عشوائية"
    },      

    ["new"] = {
        ["en"] = "new",
        ["pt-BR"] = "novas",
        ["es"] = "nuevas",
        ["ru"] = "новые",
        ["zh-CN"] = "新歌",
        ["id"] = "baru",
        ["fil"] = "bago",
        ["vi"] = "mới",
        ["fr"] = "nouvelles",
        ["de"] = "neu",
        ["ja"] = "新着",
        ["ko"] = "새로운",
        ["tr"] = "yeni",
        ["ar"] = "جديد"
    },

    ["peak"] = {
        ["en"] = "peak",
        ["pt-BR"] = "top",               -- natural slang for “best”
        ["es"] = "top",                   -- widely used in gaming/music context
        ["ru"] = "топ",                  -- “top” is commonly used in Russian slang
        ["zh-CN"] = "巅峰",               -- literally “pinnacle/peak”, natural in Chinese
        ["id"] = "terbaik",              -- means “the best”
        ["fil"] = "pinaka",               -- short for “pinakamahusay”, natural in Filipino
        ["vi"] = "đỉnh",                  -- literally “peak/top”, sounds natural
        ["fr"] = "top",                   -- common slang in French gaming/music
        ["de"] = "top",                   -- used as-is in German
        ["ja"] = "トップ",                  -- “top” in katakana, widely used
        ["ko"] = "최고",                   -- literally “the best/top”
        ["tr"] = "en iyi",                 -- literally “the best”
        ["ar"] = "الأفضل"                  -- literally “the best”
    },

    ["best"] = {
        ["en"] = "best",
        ["pt-BR"] = "melhores",
        ["es"] = "mejores",
        ["ru"] = "лучшие",
        ["zh-CN"] = "最佳",
        ["id"] = "terbaik",
        ["fil"] = "pinakamahusay",
        ["vi"] = "hay nhất",
        ["fr"] = "meilleurs",
        ["de"] = "beste",
        ["ja"] = "ベスト",
        ["ko"] = "최고",
        ["tr"] = "en iyi",
        ["ar"] = "الأفضل"
    },

    ["epic"] = {
        ["en"] = "epic",
        ["pt-BR"] = "épico",
        ["es"] = "épico",
        ["ru"] = "эпик",
        ["zh-CN"] = "史诗",
        ["id"] = "epik",
        ["fil"] = "epiko",
        ["vi"] = "hùng tráng",
        ["fr"] = "épique",
        ["de"] = "episch",
        ["ja"] = "エピック",
        ["ko"] = "에픽",
        ["tr"] = "epik",
        ["ar"] = "ملحمي"
    },

    ["beautiful"] = {
        ["en"] = "beautiful",
        ["pt-BR"] = "bonitas",
        ["es"] = "hermosas",
        ["ru"] = "красивые",
        ["zh-CN"] = "美丽",
        ["id"] = "indah",
        ["fil"] = "maganda",
        ["vi"] = "tuyệt đẹp",
        ["fr"] = "belles",
        ["de"] = "schöne",
        ["ja"] = "美しい",
        ["ko"] = "아름다운",
        ["tr"] = "güzel",
        ["ar"] = "جميلة"
    },

    ["video games"] = {
        ["en"] = "video games",
        ["pt-BR"] = "videogames",
        ["es"] = "videojuegos",
        ["ru"] = "видеоигры",
        ["zh-CN"] = "电子游戏",
        ["id"] = "video game",
        ["fil"] = "mga video game",
        ["vi"] = "trò chơi điện tử",
        ["fr"] = "jeux vidéo",
        ["de"] = "videospiele",
        ["ja"] = "ビデオゲーム",
        ["ko"] = "비디오 게임",
        ["tr"] = "video oyunları",
        ["ar"] = "ألعاب فيديو"
    },

    ["movies/tv"] = {
        ["en"] = "movies/tv",
        ["pt-BR"] = "filmes/tv",
        ["es"] = "películas/tv",
        ["ru"] = "фильмы/тв",
        ["zh-CN"] = "电影/电视",
        ["id"] = "film/tv",
        ["fil"] = "pelikula/tv",
        ["vi"] = "phim/tivi",
        ["fr"] = "films/tv",
        ["de"] = "filme/tv",
        ["ja"] = "映画/テレビ",
        ["ko"] = "영화/TV",
        ["tr"] = "filmler/tv",
        ["ar"] = "أفلام/تلفاز"
    },

    ["memes"] = {
        ["en"] = "memes",
        ["pt-BR"] = "memes",
        ["es"] = "memes",
        ["ru"] = "мемы",
        ["zh-CN"] = "梗歌",
        ["id"] = "meme",
        ["fil"] = "meme",
        ["vi"] = "meme",
        ["fr"] = "mèmes",
        ["de"] = "memes",
        ["ja"] = "ミーム",
        ["ko"] = "밈",
        ["tr"] = "memler",
        ["ar"] = "ميمات"
    },

    ["classical"] = {
        ["en"] = "classical",
        ["pt-BR"] = "clássicas",
        ["es"] = "clásicas",
        ["ru"] = "классика",
        ["zh-CN"] = "古典",
        ["id"] = "klasik",
        ["fil"] = "klasiko",
        ["vi"] = "cổ điển",
        ["fr"] = "classiques",
        ["de"] = "klassisch",
        ["ja"] = "クラシック",
        ["ko"] = "클래식",
        ["tr"] = "klasik",
        ["ar"] = "كلاسيكي"
    },

    ["pop/hiphop"] = {
        ["en"] = "pop/hiphop",
        ["pt-BR"] = "pop/hiphop",
        ["es"] = "pop/hiphop",
        ["ru"] = "поп/хип-хоп",
        ["zh-CN"] = "流行/嘻哈",
        ["id"] = "pop/hiphop",
        ["fil"] = "pop/hiphop",
        ["vi"] = "pop/hiphop",
        ["fr"] = "pop/hiphop",
        ["de"] = "pop/hiphop",
        ["ja"] = "ポップ/ヒップホップ",
        ["ko"] = "팝/힙합",
        ["tr"] = "pop/hiphop",
        ["ar"] = "بوب/هيب هوب"
    },

    ["anime/jpop"] = {
        ["en"] = "anime/jpop",
        ["pt-BR"] = "anime/jpop",
        ["es"] = "anime/jpop",
        ["ru"] = "аниме/jpop",
        ["zh-CN"] = "动漫/J-pop",
        ["id"] = "anime/jpop",
        ["fil"] = "anime/jpop",
        ["vi"] = "anime/jpop",
        ["fr"] = "anime/jpop",
        ["de"] = "anime/jpop",
        ["ja"] = "アニメ/J-pop",
        ["ko"] = "애니메/제이팝",
        ["tr"] = "anime/jpop",
        ["ar"] = "أنمي/J-pop"
    },

    ["sad"] = {
        ["en"] = "sad",
        ["pt-BR"] = "tristes",
        ["es"] = "tristes",
        ["ru"] = "грустные",
        ["zh-CN"] = "伤感",
        ["id"] = "sedih",
        ["fil"] = "malungkot",
        ["vi"] = "buồn",
        ["fr"] = "tristes",
        ["de"] = "traurig",
        ["ja"] = "悲しい",
        ["ko"] = "슬픈",
        ["tr"] = "üzgün",
        ["ar"] = "حزين"
    },

    ["electronic"] = {
        ["en"] = "electronic",
        ["pt-BR"] = "eletrônicas",
        ["es"] = "electrónicas",
        ["ru"] = "электронные",
        ["zh-CN"] = "电子",
        ["id"] = "elektronik",
        ["fil"] = "elektroniko",
        ["vi"] = "điện tử",
        ["fr"] = "électroniques",
        ["de"] = "elektronisch",
        ["ja"] = "エレクトロニック",
        ["ko"] = "일렉트로닉",
        ["tr"] = "elektronik",
        ["ar"] = "إلكترونية"
    },

    ["rock"] = {
        ["en"] = "rock",
        ["pt-BR"] = "rock",
        ["es"] = "rock",
        ["ru"] = "рок",
        ["zh-CN"] = "摇滚",
        ["id"] = "rock",
        ["fil"] = "rock",
        ["vi"] = "rock",
        ["fr"] = "rock",
        ["de"] = "rock",
        ["ja"] = "ロック",
        ["ko"] = "록",
        ["tr"] = "rock",
        ["ar"] = "روك"
    },

    ["creepy/weirdcore"] = {
        ["en"] = "creepy/weirdcore",
        ["pt-BR"] = "assustador/weirdcore",
        ["es"] = "espeluznante/weirdcore",
        ["ru"] = "жутко/weirdcore",
        ["zh-CN"] = "诡异/weirdcore",
        ["id"] = "menyeramkan/weirdcore",
        ["fil"] = "nakakatakot/weirdcore",
        ["vi"] = "rùng rợn/weirdcore",
        ["fr"] = "effrayant/weirdcore",
        ["de"] = "gruselig/weirdcore",
        ["ja"] = "不気味/weirdcore",
        ["ko"] = "섬뜩한/weirdcore",
        ["tr"] = "ürkütücü/weirdcore",
        ["ar"] = "مخيف/weirdcore"
    },

    ["unsupported executor"] = {
        ["en"] = "Your executor may not support this feature.",
        ["pt-BR"] = "Seu executor pode não suportar este recurso.",
        ["es"] = "Tu executor puede que no sea compatible con esta función.",
        ["ru"] = "Ваш исполнитель может не поддерживать эту функцию.",
        ["zh-CN"] = "您的执行器可能不支持此功能。",
        ["id"] = "Eksekutormu mungkin tidak mendukung fitur ini.",
        ["fil"] = "Maaaring hindi suportado ng iyong executor ang tampok na ito.",
        ["vi"] = "Trình thực thi của bạn có thể không hỗ trợ tính năng này.",
        ["fr"] = "Votre exécuteur peut ne pas prendre en charge cette fonctionnalité.",
        ["de"] = "Dein Executor unterstützt diese Funktion möglicherweise nicht.",
        ["ja"] = "あなたのエグゼキュータはこの機能をサポートしていない可能性があります。",
        ["ko"] = "사용 중인 실행기가 이 기능을 지원하지 않을 수 있습니다.",
        ["tr"] = "Executor’ınız bu özelliği desteklemeyebilir.",
        ["ar"] = "قد لا يدعم برنامج التنفيذ الخاص بك هذه الميزة."
    },

    ["custom songs"] = {
        ["en"] = "custom songs",
        ["pt-BR"] = "músicas custom",
        ["es"] = "canciones custom",
        ["ru"] = "кастом песни",
        ["zh-CN"] = "自定义歌曲",
        ["id"] = "lagu kustom",
        ["fil"] = "custom na kanta",
        ["vi"] = "bài hát tùy chỉnh",
        ["fr"] = "sons custom",
        ["de"] = "custom songs",
        ["ja"] = "カスタム曲",
        ["ko"] = "사용자 곡",
        ["tr"] = "özel şarkılar",
        ["ar"] = "أغاني مخصصة"
    },
    
    ["favourites"] = {
        ["en"] = "favourites",
        ["pt-BR"] = "favoritas",
        ["es"] = "favoritas",
        ["ru"] = "избранное",
        ["zh-CN"] = "收藏",
        ["id"] = "favorit",
        ["fil"] = "paborito",
        ["vi"] = "yêu thích",
        ["fr"] = "favoris",
        ["de"] = "favoriten",
        ["ja"] = "お気に入り",
        ["ko"] = "즐겨찾기",
        ["tr"] = "favoriler",
        ["ar"] = "المفضلة"
    },

    ["other"] = {
        ["en"] = "other",
        ["pt-BR"] = "outros",
        ["es"] = "otros",
        ["ru"] = "другое",
        ["zh-CN"] = "其他",
        ["id"] = "lainnya",
        ["fil"] = "iba pa",
        ["vi"] = "khác",
        ["fr"] = "autres",
        ["de"] = "andere",
        ["ja"] = "その他",
        ["ko"] = "기타",
        ["tr"] = "diğer",
        ["ar"] = "أخرى"
    },

    ["all"] = {
        ["en"] = "all",
        ["pt-BR"] = "todas",
        ["es"] = "todas",
        ["ru"] = "все",
        ["zh-CN"] = "全部",
        ["id"] = "semua",
        ["fil"] = "lahat",
        ["vi"] = "tất cả",
        ["fr"] = "toutes",
        ["de"] = "alle",
        ["ja"] = "すべて",
        ["ko"] = "전체",
        ["tr"] = "tümü",
        ["ar"] = "الكل"
    },

    ["songplayingerror"] = {
        ["en"] = "A song is already playing.",
        ["pt-BR"] = "Uma música já está sendo reproduzida.",
        ["es"] = "Ya se está reproduciendo una canción.",
        ["ru"] = "Песня уже проигрывается.",
        ["zh-CN"] = "一首歌曲正在播放。",
        ["id"] = "Sebuah lagu sedang diputar.",
        ["fil"] = "May kasalukuyang tumutugtog na kanta.",
        ["vi"] = "Một bài hát đang phát.",
        ["fr"] = "Une chanson est déjà en cours de lecture.",
        ["de"] = "Ein Lied wird bereits abgespielt.",
        ["ja"] = "曲はすでに再生中です。",
        ["ko"] = "이미 노래가 재생 중입니다.",
        ["tr"] = "Zaten bir şarkı çalıyor.",
        ["ar"] = "هناك أغنية تعمل بالفعل."
    },

    ["stoploopingsongs"] = {
        ["en"] = "STOP LOOPING SONGS",
        ["pt-BR"] = "PARAR LOOP MÚSICAS",
        ["es"] = "DETENER LOOP",
        ["ru"] = "ОСТАНОВИТЬ ПОВТОР",
        ["zh-CN"] = "停止循环",
        ["id"] = "BERHENTI LOOP LAGU",
        ["fil"] = "ITIGIL LOOP",
        ["vi"] = "DỪNG LẶP BÀI HÁT",
        ["fr"] = "ARRÊTER LE LOOP",
        ["de"] = "LOOP LIEDER STOPPEN",
        ["ja"] = "ループ停止",
        ["ko"] = "노래 반복 중지",
        ["tr"] = "LOOP ŞARKI DURDUR",
        ["ar"] = "إيقاف التكرار"
    },    

    ["midispoofon"] = {
        ["en"] = "MIDI spoofing is turned on. Click the question mark for more info.",
        ["pt-BR"] = "A falsificação de MIDI está ativada. Clique no ponto de interrogação para mais informações.",
        ["es"] = "La falsificación de MIDI está activada. Haz clic en el signo de interrogación para más información.",
        ["ru"] = "Подделка MIDI включена. Нажмите на знак вопроса для получения дополнительной информации.",
        ["zh-CN"] = "MIDI 伪装已开启。点击问号获取更多信息。",
        ["id"] = "Spoofing MIDI telah diaktifkan. Klik tanda tanya untuk info lebih lanjut.",
        ["fil"] = "Ang pag-peke ng MIDI ay naka-on. I-click ang tandang pananong para sa karagdagang impormasyon.",
        ["vi"] = "Chế độ giả lập MIDI đã bật. Nhấn dấu hỏi để biết thêm thông tin.",
        ["fr"] = "La simulation MIDI est activée. Cliquez sur le point d'interrogation pour plus d'informations.",
        ["de"] = "MIDI-Spoofing ist aktiviert. Klicken Sie auf das Fragezeichen für weitere Informationen.",
        ["ja"] = "MIDIの偽装がオンになっています。詳細は？マークをクリックしてください。",
        ["ko"] = "MIDI 스푸핑이 켜져 있습니다. 자세한 내용은 물음표를 클릭하세요.",
        ["tr"] = "MIDI sahteleme açık. Daha fazla bilgi için soru işaretine tıklayın.",
        ["ar"] = "تم تفعيل تزييف MIDI. اضغط على علامة السؤال لمزيد من المعلومات."
    },

    ["midispoofoff"] = {
        ["en"] = "MIDI spoofing is turned off.",
        ["pt-BR"] = "A falsificação de MIDI está desativada.",
        ["es"] = "La falsificación de MIDI está desactivada.",
        ["ru"] = "Подделка MIDI выключена.",
        ["zh-CN"] = "MIDI 伪装已关闭。",
        ["id"] = "Spoofing MIDI telah dimatikan.",
        ["fil"] = "Ang pag-peke ng MIDI ay naka-off.",
        ["vi"] = "Chế độ giả lập MIDI đã tắt.",
        ["fr"] = "La simulation MIDI est désactivée.",
        ["de"] = "MIDI-Spoofing ist deaktiviert.",
        ["ja"] = "MIDIの偽装はオフになっています。",
        ["ko"] = "MIDI 스푸핑이 꺼져 있습니다.",
        ["tr"] = "MIDI sahteleme kapalı.",
        ["ar"] = "تم إيقاف تزييف MIDI."
    },

    ["beganplayingnotif"] = {
        ["en"] = "Began playing song.",
        ["pt-BR"] = "Começou a tocar a música.",
        ["es"] = "Se empezó a reproducir la canción.",
        ["ru"] = "Началось воспроизведение песни.",
        ["zh-CN"] = "开始播放歌曲。",
        ["id"] = "Mulai memutar lagu.",
        ["fil"] = "Nagsimula na ang pagtugtog ng kanta.",
        ["vi"] = "Đã bắt đầu phát bài hát.",
        ["fr"] = "Lecture de la chanson commencée.",
        ["de"] = "Das Lied wird abgespielt.",
        ["ja"] = "曲の再生を開始しました。",
        ["ko"] = "노래 재생을 시작했습니다.",
        ["tr"] = "Şarkı çalmaya başladı.",
        ["ar"] = "بدأ تشغيل الأغنية."
    },

    ["brokensongscript"] = {
        ["en"] = "Your song script is broken. If confused, contact support in the Discord.",
        ["pt-BR"] = "Seu script de música está quebrado. Se estiver confuso, entre em contato com o suporte no Discord.",
        ["es"] = "Tu script de canción está roto. Si tienes dudas, contacta al soporte en Discord.",
        ["ru"] = "Ваш скрипт песни повреждён. Если что-то непонятно, свяжитесь с поддержкой в Discord.",
        ["zh-CN"] = "你的歌曲脚本出现问题。如有疑问，请在 Discord 联系客服。",
        ["id"] = "Script lagumu rusak. Jika bingung, hubungi dukungan di Discord.",
        ["fil"] = "Sira ang iyong song script. Kung nalilito, makipag-ugnayan sa suporta sa Discord.",
        ["vi"] = "Kịch bản bài hát của bạn bị lỗi. Nếu bối rối, liên hệ hỗ trợ trên Discord.",
        ["fr"] = "Votre script de chanson est cassé. Si vous êtes perdu, contactez le support sur Discord.",
        ["de"] = "Dein Song-Skript ist fehlerhaft. Bei Fragen wende dich an den Support auf Discord.",
        ["ja"] = "あなたの曲のスクリプトが壊れています。わからない場合は、Discordのサポートに連絡してください。",
        ["ko"] = "노래 스크립트가 손상되었습니다. 혼란스러운 경우 Discord 지원팀에 문의하세요.",
        ["tr"] = "Şarkı skriptiniz bozuk. Eğer kafanız karıştıysa, Discord'daki destekle iletişime geçin.",
        ["ar"] = "سكريبت الأغنية الخاص بك معطّل. إذا كنت محتارًا، تواصل مع الدعم في Discord."
    },

    ["doubleclickdelete"] = {
        ["en"] = "Double-click to delete the song.",
        ["pt-BR"] = "Clique duas vezes para excluir a música.",
        ["es"] = "Haz doble clic para eliminar la canción.",
        ["ru"] = "Дважды щелкните, чтобы удалить песню.",
        ["zh-CN"] = "双击以删除歌曲。",
        ["id"] = "Klik dua kali untuk menghapus lagu.",
        ["fil"] = "I-double click para burahin ang kanta.",
        ["vi"] = "Nhấp đôi để xóa bài hát.",
        ["fr"] = "Double-cliquez pour supprimer la chanson.",
        ["de"] = "Doppelklicken, um das Lied zu löschen.",
        ["ja"] = "曲を削除するにはダブルクリックしてください。",
        ["ko"] = "노래를 삭제하려면 더블 클릭하세요.",
        ["tr"] = "Şarkıyı silmek için çift tıklayın.",
        ["ar"] = "انقر نقرًا مزدوجًا لحذف الأغنية."
    },

    ["songdeleted"] = {
        ["en"] = "Your song has been deleted.",
        ["pt-BR"] = "Sua música foi excluída.",
        ["es"] = "Tu canción ha sido eliminada.",
        ["ru"] = "Ваша песня была удалена.",
        ["zh-CN"] = "你的歌曲已被删除。",
        ["id"] = "Lagumu telah dihapus.",
        ["fil"] = "Ang iyong kanta ay natanggal na.",
        ["vi"] = "Bài hát của bạn đã bị xóa.",
        ["fr"] = "Votre chanson a été supprimée.",
        ["de"] = "Dein Lied wurde gelöscht.",
        ["ja"] = "あなたの曲は削除されました。",
        ["ko"] = "노래가 삭제되었습니다.",
        ["tr"] = "Şarkınız silindi.",
        ["ar"] = "تم حذف أغنيتك."
    },

    ["spoof midi title"] = {
        ["en"] = "spoof midi: what is it?",
        ["pt-BR"] = "falsificar midi: o que é?",
        ["es"] = "falsificar midi: ¿qué es?",
        ["ru"] = "подделать midi: что это?",
        ["zh-CN"] = "伪装 midi：这是什么？",
        ["id"] = "palsukan midi: apa itu?",
        ["fil"] = "peke ang midi: ano ito?",
        ["vi"] = "giả midi: đó là gì?",
        ["fr"] = "simuler midi : qu'est-ce que c'est ?",
        ["de"] = "midi vortäuschen: was ist das?",
        ["ja"] = "midiを偽装：それは何？",
        ["ko"] = "midi 스푸핑: 이게 뭐야?",
        ["tr"] = "midi sahteleme: bu nedir?",
        ["ar"] = "تزييف midi: ما هو؟"
    },
    
    ["spoof midi info"] = {
        ["en"] = "This option is showing because you're in the game 'piano rooms'. When 'spoof midi' is ON, talentless tells the game that all your inputs come from a real MIDI keyboard, not QWERTY! This makes autoplay more believable, since people will think you're playing a real piano. Just turn it on and play any song!",
        ["pt-BR"] = "Esta opção aparece porque você está no jogo 'piano rooms'. Quando 'falsificar midi' está LIGADO, talentless diz ao jogo que seus inputs vêm de um teclado MIDI real, não de um QWERTY! Isso faz o autoplay parecer mais real. Basta ativar e tocar qualquer música!",
        ["es"] = "Esta opción aparece porque estás en el juego 'piano rooms'. Cuando 'falsificar midi' está ACTIVADO, talentless le dice al juego que tus entradas vienen de un teclado MIDI real, no de QWERTY. Esto hace que el autoplay parezca más real. ¡Solo actívalo y toca cualquier canción!",
        ["ru"] = "Эта опция появилась, потому что вы в игре 'piano rooms'. Когда 'подделать midi' включён, talentless сообщает игре, что все ваши нажатия идут с реальной MIDI-клавиатуры, а не QWERTY! Автовоспроизведение выглядит убедительнее — люди подумают, что вы играете на настоящем пианино. Просто включите и играйте любую песню!",
        ["zh-CN"] = "此选项出现是因为你在游戏“piano rooms”中。当“伪装 midi”开启时，talentless 会告诉游戏你的输入来自真实的 MIDI 键盘，而不是 QWERTY！这样自动演奏更逼真，别人会以为你在弹钢琴。只需开启然后弹奏任意歌曲！",
        ["id"] = "Opsi ini muncul karena kamu sedang di game 'piano rooms'. Saat 'palsukan midi' AKTIF, talentless memberi tahu game bahwa inputmu berasal dari keyboard MIDI asli, bukan QWERTY! Ini membuat autoplay lebih meyakinkan. Cukup aktifkan dan mainkan lagu apa pun!",
        ["fil"] = "Lalabas ang opsyong ito dahil nasa laro kang 'piano rooms'. Kapag naka-ON ang 'peke ang midi', sasabihin ng talentless sa laro na galing sa totoong MIDI keyboard ang input mo, hindi QWERTY! Mas kapani-paniwala tuloy ang autoplay. I-on lang at tumugtog ng kahit anong kanta!",
        ["vi"] = "Tùy chọn này xuất hiện vì bạn đang ở trò chơi 'piano rooms'. Khi 'giả midi' BẬT, talentless sẽ báo cho game rằng các thao tác của bạn đến từ bàn phím MIDI thật, không phải QWERTY! Điều này làm autoplay thuyết phục hơn. Chỉ cần bật lên và chơi bất kỳ bài nào!",
        ["fr"] = "Cette option apparaît car vous êtes dans le jeu 'piano rooms'. Quand 'simuler midi' est ACTIVÉ, talentless fait croire au jeu que vos entrées viennent d’un vrai clavier MIDI, pas d’un QWERTY ! L’autoplay paraît ainsi plus crédible. Activez-le et jouez n’importe quelle chanson !",
        ["de"] = "Diese Option erscheint, weil du im Spiel 'piano rooms' bist. Wenn 'midi vortäuschen' AKTIV ist, sagt talentless dem Spiel, dass deine Eingaben von einem echten MIDI-Keyboard kommen, nicht von QWERTY! Dadurch wirkt Autoplay glaubwürdiger. Einfach einschalten und ein Lied spielen!",
        ["ja"] = "このオプションはゲーム「piano rooms」にいるため表示されています。「midiを偽装」をオンにすると、talentless はゲームにすべての入力がQWERTYではなく本物のMIDIキーボードから来ていると伝えます。これで自動演奏がより本物らしく見え、人々は本当にピアノを弾いていると思います。オンにして曲を弾くだけ！",
        ["ko"] = "이 옵션은 'piano rooms' 게임에 있기 때문에 표시됩니다. 'midi 스푸핑'을 켜면, talentless가 게임에 당신의 입력이 QWERTY가 아닌 실제 MIDI 키보드에서 온 것처럼 알려줍니다! 이렇게 하면 자동 연주가 훨씬 그럴듯해집니다. 그냥 켜고 아무 노래나 연주해 보세요!",
        ["tr"] = "Bu seçenek 'piano rooms' oyununda olduğun için görünüyor. 'midi sahteleme' AÇIK olduğunda, talentless oyuna tüm girişlerinin gerçek bir MIDI klavyeden geldiğini söyler, QWERTY’den değil! Bu, otomatik çalmayı daha inandırıcı yapar. Sadece aç ve herhangi bir şarkıyı çal!",
        ["ar"] = "يظهر هذا الخيار لأنك في لعبة 'piano rooms'. عند تفعيل 'تزييف midi'، سيخبر talentless اللعبة أن جميع مدخلاتك تأتي من لوحة مفاتيح MIDI حقيقية، وليس QWERTY! هذا يجعل التشغيل التلقائي أكثر إقناعًا. فقط قم بتشغيله واعزف أي أغنية!"
    },
    
    ["midi connect reminder"] = {
        ["en"] = "Make sure to turn on midi connect!",
        ["pt-BR"] = "Não esqueça de ativar o midi connect!",
        ["es"] = "¡Asegúrate de activar midi connect!",
        ["ru"] = "Обязательно включите midi connect!",
        ["zh-CN"] = "记得开启 midi connect！",
        ["id"] = "Pastikan menyalakan midi connect!",
        ["fil"] = "Siguraduhin na naka-on ang midi connect!",
        ["vi"] = "Nhớ bật midi connect!",
        ["fr"] = "N’oubliez pas d’activer midi connect !",
        ["de"] = "Stelle sicher, dass midi connect eingeschaltet ist!",
        ["ja"] = "必ず midi connect をオンにしてください！",
        ["ko"] = "midi connect를 꼭 켜세요!",
        ["tr"] = "Midi connect'i açmayı unutma!",
        ["ar"] = "تأكد من تشغيل midi connect!"
    },

    ["custom song instructions"] = {
        ["en"] = "Convert a MIDI file into a song script using MIDI2LUA (bit.ly/midi2lua). Then, paste the full, unedited script here to add the song to your GUI in TALENTLESS!",
        ["pt-BR"] = "Converta um arquivo MIDI em script usando MIDI2LUA (bit.ly/midi2lua). Depois, cole o script completo aqui para adicionar a música no TALENTLESS!",
        ["es"] = "Convierte un archivo MIDI en script con MIDI2LUA (bit.ly/midi2lua). Luego pega el script completo aquí para añadir la canción en TALENTLESS.",
        ["ru"] = "Преобразуйте MIDI-файл в скрипт через MIDI2LUA (bit.ly/midi2lua). Затем вставьте полный скрипт сюда, чтобы добавить песню в TALENTLESS!",
        ["zh-CN"] = "使用 MIDI2LUA (bit.ly/midi2lua) 将 MIDI 文件转换为脚本。然后将完整脚本粘贴到这里，以添加歌曲到 TALENTLESS！",
        ["id"] = "Ubah file MIDI jadi script dengan MIDI2LUA (bit.ly/midi2lua). Lalu tempel script lengkap di sini untuk menambah lagu ke TALENTLESS!",
        ["fil"] = "I-convert ang MIDI file sa script gamit ang MIDI2LUA (bit.ly/midi2lua). Pagkatapos, i-paste ang buong script dito para maidagdag ang kanta sa TALENTLESS!",
        ["vi"] = "Chuyển file MIDI thành script bằng MIDI2LUA (bit.ly/midi2lua). Sau đó dán script đầy đủ vào đây để thêm bài hát vào TALENTLESS!",
        ["fr"] = "Convertissez un fichier MIDI en script avec MIDI2LUA (bit.ly/midi2lua). Puis collez le script complet ici pour ajouter la chanson à TALENTLESS !",
        ["de"] = "Wandle eine MIDI-Datei in ein Script mit MIDI2LUA (bit.ly/midi2lua) um. Danach füge das vollständige Script hier ein, um das Lied in TALENTLESS hinzuzufügen!",
        ["ja"] = "MIDIファイルをMIDI2LUA (bit.ly/midi2lua)でスクリプトに変換します。その後、完全なスクリプトをここに貼り付けてTALENTLESSに曲を追加してください！",
        ["ko"] = "MIDI 파일을 MIDI2LUA (bit.ly/midi2lua)로 변환하세요. 그런 다음 전체 스크립트를 여기에 붙여 넣어 TALENTLESS에 노래를 추가하세요!",
        ["tr"] = "Bir MIDI dosyasını MIDI2LUA (bit.ly/midi2lua) ile script'e çevir. Sonra tam script'i buraya yapıştırarak şarkıyı TALENTLESS'e ekle!",
        ["ar"] = "حوّل ملف MIDI إلى سكربت باستخدام MIDI2LUA (bit.ly/midi2lua). ثم الصق السكربت الكامل هنا لإضافة الأغنية في TALENTLESS!"
    },

    ["insert song script"] = {
        ["en"] = "Insert your song script and the name of your song.",
        ["pt-BR"] = "Insira o script e o nome da sua música.",
        ["es"] = "Inserta el script y el nombre de tu canción.",
        ["ru"] = "Вставьте скрипт и название вашей песни.",
        ["zh-CN"] = "输入脚本和歌曲名称。",
        ["id"] = "Masukkan script dan nama lagumu.",
        ["fil"] = "Ilagay ang script at pangalan ng kanta mo.",
        ["vi"] = "Nhập script và tên bài hát của bạn.",
        ["fr"] = "Insérez le script et le nom de votre chanson.",
        ["de"] = "Füge dein Script und den Liednamen ein.",
        ["ja"] = "スクリプトと曲名を入力してください。",
        ["ko"] = "스크립트와 노래 이름을 입력하세요.",
        ["tr"] = "Şarkı scriptini ve adını gir.",
        ["ar"] = "أدخل السكربت واسم أغنيتك."
    },

    ["song name prompt"] = {
        ["en"] = "What's the name of your song?",
        ["pt-BR"] = "Qual o nome da sua música?",
        ["es"] = "¿Cuál es el nombre de tu canción?",
        ["ru"] = "Как называется ваша песня?",
        ["zh-CN"] = "你的歌曲叫什么名字？",
        ["id"] = "Apa nama lagumu?",
        ["fil"] = "Ano ang pangalan ng kanta mo?",
        ["vi"] = "Tên bài hát của bạn là gì?",
        ["fr"] = "Quel est le nom de ta chanson ?",
        ["de"] = "Wie heißt dein Lied?",
        ["ja"] = "曲の名前は何ですか？",
        ["ko"] = "노래 제목은 무엇인가요?",
        ["tr"] = "Şarkının adı ne?",
        ["ar"] = "ما اسم أغنيتك؟"
    },

    ["submit"] = {
        ["en"] = "SUBMIT!",
        ["pt-BR"] = "ENVIAR!",
        ["es"] = "ENVIAR!",
        ["ru"] = "ОТПРАВИТЬ!",
        ["zh-CN"] = "提交！",
        ["id"] = "KIRIM!",
        ["fil"] = "IPASA!",
        ["vi"] = "GỬI!",
        ["fr"] = "ENVOYER !",
        ["de"] = "SENDEN!",
        ["ja"] = "送信！",
        ["ko"] = "제출!",
        ["tr"] = "GÖNDER!",
        ["ar"] = "إِرْسَال!"
    },

    ["songnameexists"] = {
        ["en"] = "You already have a song with this name.",
        ["pt-BR"] = "Você já tem uma música com esse nome.",
        ["es"] = "Ya tienes una canción con ese nombre.",
        ["ru"] = "У вас уже есть песня с таким названием.",
        ["zh-CN"] = "你已经有同名歌曲。",
        ["id"] = "Kamu sudah punya lagu dengan nama ini.",
        ["fil"] = "May kanta ka na sa pangalang ito.",
        ["vi"] = "Bạn đã có bài hát với tên này.",
        ["fr"] = "Vous avez déjà une chanson avec ce nom.",
        ["de"] = "Du hast bereits ein Lied mit diesem Namen.",
        ["ja"] = "この名前の曲は既にあります。",
        ["ko"] = "이미 같은 이름의 노래가 있습니다.",
        ["tr"] = "Bu isimde bir şarkınız zaten var.",
        ["ar"] = "لديك بالفعل أغنية بهذا الاسم."
    },
    
    ["songadded"] = {
        ["en"] = "You have added the song \"%s\".",
        ["pt-BR"] = "Você adicionou a música \"%s\".",
        ["es"] = "Has añadido la canción \"%s\".",
        ["ru"] = "Вы добавили песню \"%s\".",
        ["zh-CN"] = "你已添加歌曲「%s」。",
        ["id"] = "Kamu telah menambahkan lagu \"%s\".",
        ["fil"] = "Nagdagdag ka ng kanta na \"%s\".",
        ["vi"] = "Bạn đã thêm bài hát \"%s\".",
        ["fr"] = "Vous avez ajouté la chanson \"%s\".",
        ["de"] = "Du hast das Lied \"%s\" hinzugefügt.",
        ["ja"] = "曲「%s」を追加しました。",
        ["ko"] = "노래 \"%s\"을(를) 추가했습니다.",
        ["tr"] = "Şarkı \"%s\" eklendi.",
        ["ar"] = "لقد أضفت الأغنية \"%s\"."
    },
    
    ["copy"] = {
        ["en"] = "copy!",
        ["pt-BR"] = "copiar!",
        ["es"] = "copiar!",
        ["ru"] = "копировать!",
        ["zh-CN"] = "复制！",
        ["id"] = "salin!",
        ["fil"] = "kopya!",
        ["vi"] = "sao chép!",
        ["fr"] = "copier !",
        ["de"] = "kopieren!",
        ["ja"] = "コピー！",
        ["ko"] = "복사!",
        ["tr"] = "kopyala!",
        ["ar"] = "نسخ!"
    },
    
    ["help info"] = {
        ["en"] = "Need help with TALENTLESS? Want to turn MIDI files into autoplay scripts, find tutorials, or get help from the Discord server? Click the button below to copy the link to my official website!",
        ["pt-BR"] = "Precisa de ajuda com TALENTLESS? Quer transformar arquivos MIDI em scripts de autoplay, encontrar tutoriais ou obter ajuda no Discord? Clique no botão abaixo para copiar o link do site oficial!",
        ["es"] = "¿Necesitas ayuda con TALENTLESS? ¿Quieres convertir archivos MIDI en scripts de autoplay, encontrar tutoriales o recibir ayuda en Discord? Haz clic en el botón abajo para copiar el enlace a mi sitio oficial!",
        ["ru"] = "Нужна помощь с TALENTLESS? Хотите конвертировать MIDI-файлы в скрипты автоплея, найти уроки или получить помощь в Discord? Нажмите кнопку ниже, чтобы скопировать ссылку на официальный сайт!",
        ["zh-CN"] = "需要 TALENTLESS 的帮助吗？想将 MIDI 文件转换为自动播放脚本、查找教程或在 Discord 获取帮助？点击下方按钮复制我的官方网站链接！",
        ["id"] = "Perlu bantuan dengan TALENTLESS? Ingin mengubah file MIDI menjadi script autoplay, mencari tutorial, atau mendapatkan bantuan dari Discord? Klik tombol di bawah untuk menyalin link situs resmi saya!",
        ["fil"] = "Kailangan mo ba ng tulong sa TALENTLESS? Gusto mo bang gawing autoplay script ang MIDI files, humanap ng tutorials, o humingi ng tulong sa Discord? I-click ang button sa ibaba para kopyahin ang link sa aking opisyal na website!",
        ["vi"] = "Cần trợ giúp với TALENTLESS? Muốn chuyển file MIDI thành script autoplay, tìm hướng dẫn hoặc nhận trợ giúp từ server Discord? Nhấn nút bên dưới để sao chép liên kết tới website chính thức của tôi!",
        ["fr"] = "Besoin d'aide avec TALENTLESS ? Vous voulez convertir des fichiers MIDI en scripts d'autoplay, trouver des tutoriels ou obtenir de l'aide sur Discord ? Cliquez sur le bouton ci-dessous pour copier le lien vers mon site officiel !",
        ["de"] = "Brauchen Sie Hilfe mit TALENTLESS? Möchten Sie MIDI-Dateien in Autoplay-Skripte umwandeln, Tutorials finden oder Hilfe im Discord erhalten? Klicken Sie auf die Schaltfläche unten, um den Link zu meiner offiziellen Website zu kopieren!",
        ["ja"] = "TALENTLESSの使い方で困っていますか？MIDIファイルを自動演奏スクリプトに変換したり、チュートリアルを探したり、Discordでサポートを受けたりできます。下のボタンをクリックして公式サイトのリンクをコピーしてください！",
        ["ko"] = "TALENTLESS에 도움이 필요하신가요? MIDI 파일을 자동 재생 스크립트로 변환하거나, 튜토리얼을 찾거나, Discord 서버에서 도움을 받고 싶나요? 아래 버튼을 클릭하여 공식 웹사이트 링크를 복사하세요!",
        ["tr"] = "TALENTLESS hakkında yardıma mı ihtiyacınız var? MIDI dosyalarını autoplay script’lere dönüştürmek, rehberler bulmak veya Discord sunucusundan yardım almak ister misiniz? Resmi web sitemin bağlantısını kopyalamak için aşağıdaki butona tıklayın!",
        ["ar"] = "تحتاج مساعدة مع TALENTLESS؟ تريد تحويل ملفات MIDI إلى سكربتات تشغيل تلقائي، العثور على دروس، أو الحصول على المساعدة من سيرفر Discord؟ اضغط الزر أدناه لنسخ الرابط إلى موقعي الرسمي!"
    },
    
    ["resources"] = {
        ["en"] = "resources",
        ["pt-BR"] = "recursos",
        ["es"] = "recursos",
        ["ru"] = "ресурсы",
        ["zh-CN"] = "资源",
        ["id"] = "sumber",
        ["fil"] = "mga sanggunian",
        ["vi"] = "tài nguyên",
        ["fr"] = "ressources",
        ["de"] = "ressourcen",
        ["ja"] = "リソース",
        ["ko"] = "리소스",
        ["tr"] = "kaynaklar",
        ["ar"] = "الموارد"
    },

    ["nevermind"] = {
        ["en"] = "nevermind",
        ["pt-BR"] = "deixa pra lá",
        ["es"] = "olvídalo",
        ["ru"] = "неважно",
        ["zh-CN"] = "算了",
        ["id"] = "lupakan",
        ["fil"] = "kalimutan na",
        ["vi"] = "thôi",
        ["fr"] = "laisse tomber",
        ["de"] = "egal",
        ["ja"] = "やめる",
        ["ko"] = "신경 쓰지 마",
        ["tr"] = "boşver",
        ["ar"] = "لا بأس"
    },

    ["linkcopied"] = {
        ["en"] = "https://hellohellohell0.com has been copied to your clipboard!",
        ["pt-BR"] = "https://hellohellohell0.com foi copiado para sua área de transferência!",
        ["es"] = "¡https://hellohellohell0.com se ha copiado en tu portapapeles!",
        ["ru"] = "https://hellohellohell0.com скопировано в буфер обмена!",
        ["zh-CN"] = "https://hellohellohell0.com 已复制到剪贴板！",
        ["id"] = "https://hellohellohell0.com telah disalin ke clipboard Anda!",
        ["fil"] = "Na-copy na sa clipboard ang https://hellohellohell0.com!",
        ["vi"] = "https://hellohellohell0.com đã được sao chép vào clipboard!",
        ["fr"] = "https://hellohellohell0.com a été copié dans votre presse-papiers !",
        ["de"] = "https://hellohellohell0.com wurde in deine Zwischenablage kopiert!",
        ["ja"] = "https://hellohellohell0.com がクリップボードにコピーされました！",
        ["ko"] = "https://hellohellohell0.com 가 클립보드에 복사되었습니다!",
        ["tr"] = "https://hellohellohell0.com panoya kopyalandı!",
        ["ar"] = "تم نسخ https://hellohellohell0.com إلى الحافظة!"
    },

    ["error margin"] = {
        ["en"] = "error margin: ",
        ["pt-BR"] = "margem de erro: ",
        ["es"] = "margen de error: ",
        ["ru"] = "погрешность: ",
        ["zh-CN"] = "误差范围：",
        ["id"] = "batas kesalahan: ",
        ["fil"] = "margin ng error: ",
        ["vi"] = "sai số: ",
        ["fr"] = "marge d’erreur : ",
        ["de"] = "fehlertoleranz: ",
        ["ja"] = "誤差範囲：",
        ["ko"] = "오차 범위: ",
        ["tr"] = "hata payı: ",
        ["ar"] = "هامش الخطأ: "
    },

    ["what language"] = {
        ["en"] = "what language do you speak?",
        ["pt-BR"] = "qual idioma você fala?",
        ["es"] = "¿qué idioma hablas?",
        ["ru"] = "на каком языке вы говорите?",
        ["zh-CN"] = "你会说什么语言？",
        ["id"] = "bahasa apa yang kamu bisa?",
        ["fil"] = "anong wika ang sinasalita mo?",
        ["vi"] = "bạn nói ngôn ngữ nào?",
        ["fr"] = "quelle langue parlez-vous ?",
        ["de"] = "welche sprache sprichst du?",
        ["ja"] = "あなたは何語を話しますか？",
        ["ko"] = "당신은 어떤 언어를 합니까?",
        ["tr"] = "hangi dili konuşuyorsun?",
        ["ar"] = "ما هي اللغة التي تتحدثها؟"
    },
    
    ["confirm"] = {
        ["en"] = "confirm",
        ["pt-BR"] = "confirmar",
        ["es"] = "confirmar",
        ["ru"] = "подтвердить",
        ["zh-CN"] = "确认",
        ["id"] = "konfirmasi",
        ["fil"] = "kumpirmahin",
        ["vi"] = "xác nhận",
        ["fr"] = "confirmer",
        ["de"] = "bestätigen",
        ["ja"] = "確認",
        ["ko"] = "확인",
        ["tr"] = "onayla",
        ["ar"] = "تأكيد"
    },

    ["stopping..."] = {
        ["en"] = "stopping...",
        ["pt-BR"] = "parando...",
        ["es"] = "deteniendo...",
        ["ru"] = "останавливаю...",
        ["zh-CN"] = "正在停止...",
        ["id"] = "menghentikan...",
        ["fil"] = "humihinto...",
        ["vi"] = "đang dừng...",
        ["fr"] = "arrêt...",
        ["de"] = "stoppen...",
        ["ja"] = "停止中...",
        ["ko"] = "중지 중...",
        ["tr"] = "durduruluyor...",
        ["ar"] = "جارٍ الإيقاف..."
    },

    ["songfinished"] = {
        ["en"] = "your song has finished.",
        ["pt-BR"] = "sua música terminou.",
        ["es"] = "tu canción ha terminado.",
        ["ru"] = "твоя песня закончилась.",
        ["zh-CN"] = "你的歌曲已结束。",
        ["id"] = "lagumu telah selesai.",
        ["fil"] = "tapos na ang iyong kanta.",
        ["vi"] = "bài hát của bạn đã kết thúc.",
        ["fr"] = "ta chanson est terminée.",
        ["de"] = "dein lied ist beendet.",
        ["ja"] = "曲が終了しました。",
        ["ko"] = "노래가 끝났습니다.",
        ["tr"] = "şarkın bitti.",
        ["ar"] = "انتهت أغنيتك."
    },

    ["invalidbpm"] = {
        ["en"] = "please put a valid bpm",
        ["pt-BR"] = "por favor, coloque um bpm válido",
        ["es"] = "por favor, pon un bpm válido",
        ["ru"] = "пожалуйста, укажи допустимый bpm",
        ["zh-CN"] = "请输入有效的 bpm",
        ["id"] = "tolong masukkan bpm yang valid",
        ["fil"] = "pakilagay ng valid na bpm",
        ["vi"] = "vui lòng nhập bpm hợp lệ",
        ["fr"] = "mets un bpm valide s'il te plaît",
        ["de"] = "bitte gib ein gültiges bpm ein",
        ["ja"] = "有効な bpm を入力してください",
        ["ko"] = "유효한 bpm을 입력해주세요",
        ["tr"] = "lütfen geçerli bir bpm gir",
        ["ar"] = "من فضلك أدخل bpm صالحًا"
    },    

    ["copykey"] = {
        ["en"] = "COPY KEY LINK",
        ["pt-BR"] = "COPIAR LINK DA CHAVE",
        ["es"] = "COPIAR ENLACE DE LA CLAVE",
        ["ru"] = "СКОПИРОВАТЬ ССЫЛКУ НА КЛЮЧ",
        ["zh-CN"] = "复制密钥链接",
        ["id"] = "SALIN TAUTAN KUNCI",
        ["fil"] = "KOPYAHIN ANG KEY LINK",
        ["vi"] = "SAO CHÉP LIÊN KẾT KHÓA",
        ["fr"] = "COPIER LE LIEN DE CLÉ",
        ["de"] = "SCHLÜSSELLINK KOPIEREN",
        ["ja"] = "キーリンクをコピー",
        ["ko"] = "키 링크 복사",
        ["tr"] = "ANAHTAR BAĞLANTISINI KOPYALA",
        ["ar"] = "نسخ رابط المفتاح"
    },
    
    ["keytitle"] = {
        ["en"] = "TALENTLESS requires a key to use. Follow the instructions below.",
        ["pt-BR"] = "o TALENTLESS requer uma chave para usar. siga as instruções abaixo.",
        ["es"] = "TALENTLESS requiere una clave para usarse. sigue las instrucciones de abajo.",
        ["ru"] = "для использования TALENTLESS требуется ключ. следуйте инструкциям ниже.",
        ["zh-CN"] = "使用 TALENTLESS 需要密钥。请按照以下说明操作。",
        ["id"] = "TALENTLESS memerlukan kunci untuk digunakan. ikuti instruksi di bawah ini.",
        ["fil"] = "kailangan ng TALENTLESS ng key para magamit. sundin ang mga tagubilin sa ibaba.",
        ["vi"] = "TALENTLESS cần một khóa để sử dụng. hãy làm theo hướng dẫn bên dưới.",
        ["fr"] = "TALENTLESS nécessite une clé pour fonctionner. suivez les instructions ci-dessous.",
        ["de"] = "TALENTLESS benötigt einen schlüssel zur nutzung. folge den anweisungen unten.",
        ["ja"] = "TALENTLESS を使用するにはキーが必要です。以下の手順に従ってください。",
        ["ko"] = "TALENTLESS를 사용하려면 키가 필요합니다. 아래 지침을 따르세요.",
        ["tr"] = "TALENTLESS'i kullanmak için bir anahtar gerekir. aşağıdaki talimatları izleyin.",
        ["ar"] = "يتطلب TALENTLESS مفتاحًا للاستخدام. اتبع التعليمات أدناه."
    },

    ["keyinsert"] = {
        ["en"] = "Paste key here (example: 0491)",
        ["pt-BR"] = "cole a chave aqui (exemplo: 0491)",
        ["es"] = "pega la clave aquí (ejemplo: 0491)",
        ["ru"] = "вставьте ключ здесь (пример: 0491)",
        ["zh-CN"] = "在此粘贴密钥（例如：0491）",
        ["id"] = "tempel kunci di sini (contoh: 0491)",
        ["fil"] = "i-paste ang key dito (halimbawa: 0491)",
        ["vi"] = "dán khóa vào đây (ví dụ: 0491)",
        ["fr"] = "collez la clé ici (exemple : 0491)",
        ["de"] = "füge den schlüssel hier ein (beispiel: 0491)",
        ["ja"] = "ここにキーを貼り付けてください（例: 0491）",
        ["ko"] = "여기에 키를 붙여넣으세요 (예: 0491)",
        ["tr"] = "anahtarı buraya yapıştır (örnek: 0491)",
        ["ar"] = "الصق المفتاح هنا (مثال: 0491)"
    },

    ["step1"] = {
        ["en"] = "Step 1:",
        ["pt-BR"] = "Passo 1:",
        ["es"] = "Paso 1:",
        ["ru"] = "Шаг 1:",
        ["zh-CN"] = "步骤 1：",
        ["id"] = "Langkah 1:",
        ["fil"] = "Hakbang 1:",
        ["vi"] = "Bước 1:",
        ["fr"] = "Étape 1 :",
        ["de"] = "Schritt 1:",
        ["ja"] = "ステップ 1：",
        ["ko"] = "1단계:",
        ["tr"] = "Adım 1:",
        ["ar"] = "الخطوة 1:"
    },
    
    ["step2"] = {
        ["en"] = "Step 2:",
        ["pt-BR"] = "Passo 2:",
        ["es"] = "Paso 2:",
        ["ru"] = "Шаг 2:",
        ["zh-CN"] = "步骤 2：",
        ["id"] = "Langkah 2:",
        ["fil"] = "Hakbang 2:",
        ["vi"] = "Bước 2:",
        ["fr"] = "Étape 2 :",
        ["de"] = "Schritt 2:",
        ["ja"] = "ステップ 2：",
        ["ko"] = "2단계:",
        ["tr"] = "Adım 2:",
        ["ar"] = "الخطوة 2:"
    },
    
    ["step3"] = {
        ["en"] = "Step 3:",
        ["pt-BR"] = "Passo 3:",
        ["es"] = "Paso 3:",
        ["ru"] = "Шаг 3:",
        ["zh-CN"] = "步骤 3：",
        ["id"] = "Langkah 3:",
        ["fil"] = "Hakbang 3:",
        ["vi"] = "Bước 3:",
        ["fr"] = "Étape 3 :",
        ["de"] = "Schritt 3:",
        ["ja"] = "ステップ 3：",
        ["ko"] = "3단계:",
        ["tr"] = "Adım 3:",
        ["ar"] = "الخطوة 3:"
    },

    ["copykeysite"] = {
        ["en"] = "Click the button to copy the link for the key website.",
        ["pt-BR"] = "Clique no botão para copiar o link do site da chave.",
        ["es"] = "Haz clic en el botón para copiar el enlace del sitio de la clave.",
        ["ru"] = "Нажмите кнопку, чтобы скопировать ссылку на сайт ключа.",
        ["zh-CN"] = "点击按钮以复制密钥网站的链接。",
        ["id"] = "Klik tombol untuk menyalin tautan ke situs kunci.",
        ["fil"] = "I-click ang button para kopyahin ang link ng key website.",
        ["vi"] = "Nhấn nút để sao chép liên kết đến trang web lấy mã.",
        ["fr"] = "Cliquez sur le bouton pour copier le lien du site de la clé.",
        ["de"] = "Klicke auf den Knopf, um den Link zur Schlüssel-Website zu kopieren.",
        ["ja"] = "ボタンをクリックしてキーサイトのリンクをコピーしてください。",
        ["ko"] = "버튼을 눌러 키 웹사이트 링크를 복사하세요.",
        ["tr"] = "Anahtar web sitesinin bağlantısını kopyalamak için düğmeye tıklayın.",
        ["ar"] = "انقر على الزر لنسخ رابط موقع المفتاح."
    },

    ["completetaskforkey"] = {
        ["en"] = "Complete the task on the website to get the key.",
        ["pt-BR"] = "Conclua a tarefa no site para obter a chave.",
        ["es"] = "Completa la tarea en el sitio web para obtener la clave.",
        ["ru"] = "Выполните задание на сайте, чтобы получить ключ.",
        ["zh-CN"] = "在网站上完成任务即可获得密钥。",
        ["id"] = "Selesaikan tugas di situs web untuk mendapatkan kunci.",
        ["fil"] = "Kumpletuhin ang task sa website para makuha ang key.",
        ["vi"] = "Hoàn thành nhiệm vụ trên trang web để nhận mã.",
        ["fr"] = "Complétez la tâche sur le site pour obtenir la clé.",
        ["de"] = "Schließe die Aufgabe auf der Website ab, um den Schlüssel zu erhalten.",
        ["ja"] = "ウェブサイトのタスクを完了してキーを入手してください。",
        ["ko"] = "웹사이트에서 작업을 완료하면 키를 받을 수 있습니다.",
        ["tr"] = "Anahtarı almak için sitedeki görevi tamamlayın.",
        ["ar"] = "أكمِل المهمة على الموقع لتحصل على المفتاح."
    },

    ["pastekeyhere"] = {
        ["en"] = "Paste the key here →",
        ["pt-BR"] = "Cole a chave aqui →",
        ["es"] = "Pega la clave aquí →",
        ["ru"] = "Вставьте ключ сюда →",
        ["zh-CN"] = "在此粘贴密钥 →",
        ["id"] = "Tempel kunci di sini →",
        ["fil"] = "I-paste ang key dito →",
        ["vi"] = "Dán mã vào đây →",
        ["fr"] = "Collez la clé ici →",
        ["de"] = "Füge den Schlüssel hier ein →",
        ["ja"] = "ここにキーを貼り付け →",
        ["ko"] = "여기에 키를 붙여넣기 →",
        ["tr"] = "Anahtarı buraya yapıştır →",
        ["ar"] = "ألصِق المفتاح هنا →"
    },

    ["submitkey"] = {
        ["en"] = "Submit Key!",
        ["pt-BR"] = "Enviar chave!",
        ["es"] = "Enviar clave!",
        ["ru"] = "Отправить ключ!",
        ["zh-CN"] = "提交密钥！",
        ["id"] = "Kirim kunci!",
        ["fil"] = "Isumite ang key!",
        ["vi"] = "Gửi mã!",
        ["fr"] = "Envoyer la clé !",
        ["de"] = "Schlüssel senden!",
        ["ja"] = "キーを送信！",
        ["ko"] = "키 제출!",
        ["tr"] = "Anahtarı gönder!",
        ["ar"] = "أرسل المفتاح!"
    },
    
    ["keylinkcopied"] = {
        ["en"] = "The link to the key has been copied to your clipboard.",
        ["pt-BR"] = "O link da chave foi copiado para sua área de transferência.",
        ["es"] = "El enlace de la clave se copió en tu portapapeles.",
        ["ru"] = "Ссылка на ключ скопирована в ваш буфер обмена.",
        ["zh-CN"] = "密钥链接已复制到您的剪贴板。",
        ["id"] = "Tautan kunci telah disalin ke papan klip Anda.",
        ["fil"] = "Nakopya na sa iyong clipboard ang link ng key.",
        ["vi"] = "Liên kết khóa đã được sao chép vào clipboard của bạn.",
        ["fr"] = "Le lien de la clé a été copié dans votre presse-papiers.",
        ["de"] = "Der Schlüssellink wurde in deine Zwischenablage kopiert.",
        ["ja"] = "キーのリンクがクリップボードにコピーされました。",
        ["ko"] = "키 링크가 클립보드에 복사되었습니다.",
        ["tr"] = "Anahtar bağlantısı panonuza kopyalandı.",
        ["ar"] = "تم نسخ رابط المفتاح إلى الحافظة الخاصة بك."
    },

    ["keyempty"] = {
        ["en"] = "The key input is empty. Read the instructions to get the key.",
        ["pt-BR"] = "O campo da chave está vazio. Leia as instruções para obter a chave.",
        ["es"] = "El campo de la clave está vacío. Lee las instrucciones para obtener la clave.",
        ["ru"] = "Поле ввода ключа пусто. Прочтите инструкции, чтобы получить ключ.",
        ["zh-CN"] = "密钥输入为空。请阅读说明以获取密钥。",
        ["id"] = "Input kunci kosong. Baca instruksinya untuk mendapatkan kunci.",
        ["fil"] = "Walang laman ang key input. Basahin ang mga tagubilin para makuha ang key.",
        ["vi"] = "Ô nhập khóa đang trống. Hãy đọc hướng dẫn để lấy khóa.",
        ["fr"] = "Le champ de la clé est vide. Lisez les instructions pour obtenir la clé.",
        ["de"] = "Die Schlüsseleingabe ist leer. Lies die Anweisungen, um den Schlüssel zu erhalten.",
        ["ja"] = "キー入力が空です。キーを取得するには指示を読んでください。",
        ["ko"] = "키 입력이 비어 있습니다. 키를 얻으려면 지침을 읽으세요.",
        ["tr"] = "Anahtar girişi boş. Anahtarı almak için talimatları okuyun.",
        ["ar"] = "إدخال المفتاح فارغ. اقرأ التعليمات للحصول على المفتاح."
    },
    
    ["keysuccess"] = {
        ["en"] = "Success.",
        ["pt-BR"] = "Sucesso.",
        ["es"] = "Éxito.",
        ["ru"] = "Успешно.",
        ["zh-CN"] = "成功。",
        ["id"] = "Sukses.",
        ["fil"] = "Tagumpay.",
        ["vi"] = "Thành công.",
        ["fr"] = "Succès.",
        ["de"] = "Erfolg.",
        ["ja"] = "成功。",
        ["ko"] = "성공.",
        ["tr"] = "Başarılı.",
        ["ar"] = "نجاح."
    },
      
    ["keyinvalid"] = {
        ["en"] = "Your key is invalid. If you need help, join the discord server by clicking the question mark button.",
        ["pt-BR"] = "Sua chave é inválida. Se precisar de ajuda, entre no servidor do Discord clicando no botão de interrogação.",
        ["es"] = "Tu clave es inválida. Si necesitas ayuda, únete al servidor de Discord haciendo clic en el botón de interrogación.",
        ["ru"] = "Ваш ключ недействителен. Если нужна помощь, присоединяйтесь к серверу Discord, нажав на кнопку с вопросительным знаком.",
        ["zh-CN"] = "您的密钥无效。如需帮助，请点击问号按钮加入 Discord 服务器。",
        ["id"] = "Kunci Anda tidak valid. Jika membutuhkan bantuan, bergabunglah dengan server Discord dengan mengklik tombol tanda tanya.",
        ["fil"] = "Ang iyong key ay hindi wasto. Kung kailangan mo ng tulong, sumali sa Discord server sa pamamagitan ng pag-click sa question mark na button.",
        ["vi"] = "Khóa của bạn không hợp lệ. Nếu cần trợ giúp, hãy tham gia server Discord bằng cách nhấn nút dấu hỏi.",
        ["fr"] = "Votre clé est invalide. Si vous avez besoin d'aide, rejoignez le serveur Discord en cliquant sur le bouton point d'interrogation.",
        ["de"] = "Dein Schlüssel ist ungültig. Wenn du Hilfe brauchst, tritt dem Discord-Server bei, indem du auf die Fragezeichen-Schaltfläche klickst.",
        ["ja"] = "あなたのキーは無効です。ヘルプが必要な場合は、クエスチョンマークボタンをクリックして Discord サーバーに参加してください。",
        ["ko"] = "키가 유효하지 않습니다. 도움이 필요하면 물음표 버튼을 클릭하여 Discord 서버에 참여하세요.",
        ["tr"] = "Anahtarınız geçersiz. Yardıma ihtiyacınız varsa, soru işareti düğmesine tıklayarak Discord sunucusuna katılın.",
        ["ar"] = "المفتاح الخاص بك غير صالح. إذا كنت بحاجة إلى مساعدة، انضم إلى خادم Discord بالنقر على زر علامة الاستفهام."
    },
    
    ["keyexpired"] = {
        ["en"] = "This key is expired. The key was reset recently. Redo the tasks on the key website to get a new key.",
        ["pt-BR"] = "Esta chave expirou. A chave foi redefinida recentemente. Refaça as tarefas no site da chave para obter uma nova chave.",
        ["es"] = "Esta clave ha expirado. La clave se reinició recientemente. Vuelve a hacer las tareas en el sitio web de la clave para obtener una nueva.",
        ["ru"] = "Этот ключ истёк. Ключ был недавно сброшен. Выполните задания на сайте ключа, чтобы получить новый.",
        ["zh-CN"] = "此密钥已过期。密钥最近被重置。请重新在密钥网站完成任务以获取新密钥。",
        ["id"] = "Kunci ini sudah kedaluwarsa. Kunci baru-baru ini direset. Lakukan kembali tugas di situs kunci untuk mendapatkan kunci baru.",
        ["fil"] = "Paso na ang key na ito. Kakare-reset lang ng key kamakailan. Gawin muli ang mga task sa key website para makakuha ng bagong key.",
        ["vi"] = "Khóa này đã hết hạn. Khóa vừa được đặt lại gần đây. Hãy làm lại các nhiệm vụ trên trang web để nhận khóa mới.",
        ["fr"] = "Cette clé a expiré. La clé a été réinitialisée récemment. Refaite les tâches sur le site pour obtenir une nouvelle clé.",
        ["de"] = "Dieser Schlüssel ist abgelaufen. Der Schlüssel wurde vor Kurzem zurückgesetzt. Wiederhole die Aufgaben auf der Schlüssel-Website, um einen neuen Schlüssel zu erhalten.",
        ["ja"] = "このキーは期限切れです。キーは最近リセットされました。新しいキーを取得するには、キーサイトでタスクをやり直してください。",
        ["ko"] = "이 키는 만료되었습니다. 키가 최근에 초기화되었습니다. 새로운 키를 받으려면 키 웹사이트에서 작업을 다시 수행하세요.",
        ["tr"] = "Bu anahtarın süresi doldu. Anahtar yakın zamanda sıfırlandı. Yeni bir anahtar almak için anahtar sitesindeki görevleri yeniden yapın.",
        ["ar"] = "هذه المفتاح منتهي الصلاحية. تم إعادة تعيين المفتاح مؤخرًا. أعد القيام بالمهام في موقع المفتاح للحصول على مفتاح جديد."
    },

    ["categories"] = {
        ["en"] = "categories",
        ["pt-BR"] = "categorias",
        ["es"] = "categorías",
        ["ru"] = "категории",
        ["zh-CN"] = "分类",
        ["id"] = "kategori",
        ["fil"] = "mga kategorya",
        ["vi"] = "thể loại",
        ["fr"] = "catégories",
        ["de"] = "kategorien",
        ["ja"] = "カテゴリ",
        ["ko"] = "카테고리",
        ["tr"] = "kategoriler",
        ["ar"] = "الفئات"
    },
    
    ["utilities"] = {
        ["en"] = "utilities",
        ["pt-BR"] = "ferramentas",
        ["es"] = "utilidades",
        ["ru"] = "утилиты",
        ["zh-CN"] = "实用工具",
        ["id"] = "utilitas",
        ["fil"] = "mga kagamitan",
        ["vi"] = "tiện ích",
        ["fr"] = "outils",
        ["de"] = "dienstprogramme",
        ["ja"] = "ユーティリティ",
        ["ko"] = "유틸리티",
        ["tr"] = "araçlar",
        ["ar"] = "الأدوات"
    },

    ["copynewscript"] = {
        ["en"] = "copy new script!",
        ["pt-BR"] = "copiar novo script!",
        ["es"] = "copiar nuevo script!",
        ["ru"] = "скопировать новый скрипт!",
        ["zh-CN"] = "复制新脚本！",
        ["id"] = "salin skrip baru!",
        ["fil"] = "kopyahin ang bagong script!",
        ["vi"] = "sao chép script mới!",
        ["fr"] = "copier le nouveau script !",
        ["de"] = "neues skript kopieren!",
        ["ja"] = "新しいスクリプトをコピー！",
        ["ko"] = "새 스크립트 복사!",
        ["tr"] = "yeni scripti kopyala!",
        ["ar"] = "نسخ البرنامج الجديد!"
    },
    
    ["scriptcopied"] = {
        ["en"] = "copied!",
        ["pt-BR"] = "copiado!",
        ["es"] = "¡copiado!",
        ["ru"] = "скопировано!",
        ["zh-CN"] = "已复制！",
        ["id"] = "disalin!",
        ["fil"] = "nakopya!",
        ["vi"] = "đã sao chép!",
        ["fr"] = "copié !",
        ["de"] = "kopiert!",
        ["ja"] = "コピーしました！",
        ["ko"] = "복사됨!",
        ["tr"] = "kopyalandı!",
        ["ar"] = "تم النسخ!"
    },
    
    ["usenewloadstring"] = {
        ["en"] = "use TALENTLESS from the new loadstring:",
        ["pt-BR"] = "use TALENTLESS do novo loadstring:",
        ["es"] = "usa TALENTLESS desde el nuevo loadstring:",
        ["ru"] = "используйте TALENTLESS из новой loadstring:",
        ["zh-CN"] = "从新的 loadstring 使用 TALENTLESS：",
        ["id"] = "gunakan TALENTLESS dari loadstring baru:",
        ["fil"] = "gamitin ang TALENTLESS mula sa bagong loadstring:",
        ["vi"] = "sử dụng TALENTLESS từ loadstring mới:",
        ["fr"] = "utilisez TALENTLESS depuis le nouveau loadstring :",
        ["de"] = "verwende TALENTLESS aus dem neuen Loadstring:",
        ["ja"] = "新しい loadstring から TALENTLESS を使用：",
        ["ko"] = "새 loadstring에서 TALENTLESS 사용:",
        ["tr"] = "yeni loadstring'den TALENTLESS kullan:",
        ["ar"] = "استخدم TALENTLESS من loadstring الجديد:"
    },

    ["stopplayingplaylist"] = {
        ["en"] = "STOP PLAYING PLAYLIST",
        ["pt-BR"] = "PARAR DE TOCAR PLAYLIST",
        ["es"] = "DETENER REPRODUCCIÓN DE LA LISTA",
        ["ru"] = "ОСТАНОВИТЬ ВОСПРОИЗВЕДЕНИЕ ПЛЕЙЛИСТА",
        ["zh-CN"] = "停止播放播放列表",
        ["id"] = "HENTIKAN PEMUTARAN PLAYLIST",
        ["fil"] = "ITIGIL ANG PAG-PLAY NG PLAYLIST",
        ["vi"] = "DỪNG PHÁT DANH SÁCH PHÁT",
        ["fr"] = "ARRÊTER LA LECTURE DE LA PLAYLIST",
        ["de"] = "WIEDERGABELISTE STOPPEN",
        ["ja"] = "プレイリストの再生を停止",
        ["ko"] = "재생목록 재생 중지",
        ["tr"] = "ÇALMA LİSTESİNİ DURDUR",
        ["ar"] = "إيقاف تشغيل قائمة التشغيل"
    },
    
    ["playlist"] = {
        ["en"] = "playlist",
        ["pt-BR"] = "playlist",
        ["es"] = "lista",
        ["ru"] = "плейлист",
        ["zh-CN"] = "播放列表",
        ["id"] = "playlist",
        ["fil"] = "playlist",
        ["vi"] = "ds phát",
        ["fr"] = "playlist",
        ["de"] = "playlist",
        ["ja"] = "プレイリスト",
        ["ko"] = "재생목록",
        ["tr"] = "çalma listesi",
        ["ar"] = "قائمة التشغيل"
    },    

    ["shuffleplaylist"] = {
        ["en"] = "SHUFFLE PLAYLIST",
        ["pt-BR"] = "ALEATÓRIO",
        ["es"] = "ALEAT.",
        ["ru"] = "ПЕРЕМЕШАТЬ",
        ["zh-CN"] = "随机播放",
        ["id"] = "ACAK",
        ["fil"] = "SHUFFLE",
        ["vi"] = "XÁO TRỘN",
        ["fr"] = "ALÉATOIRE",
        ["de"] = "MISCHEN",
        ["ja"] = "シャッフル",
        ["ko"] = "셔플",
        ["tr"] = "KARIŞTIR",
        ["ar"] = "عشوائي"
    },
    
    ["playplaylist"] = {
        ["en"] = "PLAY PLAYLIST",
        ["pt-BR"] = "REPRODUZIR",
        ["es"] = "REPROD.",
        ["ru"] = "ИГРАТЬ",
        ["zh-CN"] = "播放",
        ["id"] = "PUTAR",
        ["fil"] = "PLAY",
        ["vi"] = "PHÁT",
        ["fr"] = "LIRE",
        ["de"] = "ABSPIELEN",
        ["ja"] = "再生",
        ["ko"] = "재생",
        ["tr"] = "ÇAL",
        ["ar"] = "تشغيل"
    },    

    ["playlisttooshort"] = {
        ["en"] = "You have less than 2 songs in your playlist.",
        ["pt-BR"] = "Você tem menos de 2 músicas na sua playlist.",
        ["es"] = "Tienes menos de 2 canciones en tu lista.",
        ["ru"] = "У вас меньше 2 песен в плейлисте.",
        ["zh-CN"] = "你的播放列表中少于2首歌曲。",
        ["id"] = "Daftar putar Anda kurang dari 2 lagu.",
        ["fil"] = "Mas mababa sa 2 ang kanta sa playlist mo.",
        ["vi"] = "Playlist của bạn có ít hơn 2 bài hát.",
        ["fr"] = "Vous avez moins de 2 chansons dans votre playlist.",
        ["de"] = "Du hast weniger als 2 Songs in deiner Playlist.",
        ["ja"] = "プレイリストに2曲未満しかありません。",
        ["ko"] = "재생목록에 2곡 미만이 있습니다.",
        ["tr"] = "Çalma listenizde 2'den az şarkı var.",
        ["ar"] = "لديك أقل من أغنيتين في قائمة التشغيل."
    },

    ["ALTALE"] = {
        ["ja"] = "アルタレ"
    },

    ["CENTIMETER"] = {
        ["ja"] = "センチメートル (CENTIMETER)"
    },

    ["FUKASHIGI NO CARTE"] = {
        ["ja"] = "不可思議のカルテ"
    },
    
    ["GIORNO'S THEME"] = {
        ["ja"] = "イル・ヴェント・ドーロ"
    },
    
    ["GURENGE"] = {
        ["ja"] = "紅蓮華"
    },
    
    ["MERRY-GO-ROUND OF LIFE"] = {
        ["ja"] = "秘密恋心"
    },
    
    ["HOWLS MOVING CASTLE"] = {
        ["ja"] = "人生のメリーゴーランド"
    },
    
    ["KAWAIKUTEGOMEN"] = {
        ["ja"] = "可愛くてごめん"
    },
    
    ["L'S THEME"] = {
        ["ja"] = "Lのテーマ"
    },
    
    ["LIGHT'S THEME"] = {
        ["ja"] = "ライトのテーマ"
    },
    
    ["LOST UMBRELLA"] = {
        ["ja"] = "ロストアンブレラ"
    },
    
    ["OVERTAKEN"] = {
        ["ja"] = "追いつめられた"
    },
    
    ["RACING INTO THE NIGHT"] = {
        ["ja"] = "夜に駆ける"
    },
    
    ["SHIKAIRO DAYS"] = {
        ["ja"] = "シカ色デイズ"
    },
    
    ["SILHOUETTE"] = {
        ["ja"] = "シルエット"
    },
    
    ["SPARKLE"] = {
        ["ja"] = "スパークル"
    },
    
    ["SUZUME"] = {
        ["ja"] = "すずめの戸締まり"
    },
    
    ["TIME FLOWS EVER ONWARD"] = {
        ["ja"] = "時は流れゆく"
    },
    
    ["YOUNG GIRL A"] = {
        ["ja"] = "少女A"
    },
    
    ["COMEDY"] = {
        ["ja"] = "喜劇"
    },
    
    ["GUREN NO YUMIYA"] = {
        ["ja"] = "紅蓮の弓矢"
    },
    
    ["A CRUEL ANGEL'S THESIS"] = {
        ["ja"] = "残酷な天使のテーゼ"
    },
    
    ["I'M INVINCIBLE"] = {
        ["ja"] = "私は最強"
    },
    
    ["YOUR GAZE, CREPUSCULAR"] = {
        ["ja"] = "まなざしは光"
    },
    
    ["SHINZOU WO SASEGEYO!"] = {
        ["ja"] = "心臓を捧げよ！"
    },
    
    ["HANA NI NATTE"] = {
        ["ja"] = "花になって"
    },
    
    ["SADNESS AND SORROW"] = {
        ["ja"] = "悲しみの向こう側"
    },
    
    ["WE WERE ANGELS"] = {
        ["ja"] = "僕達は天使だった"
    },
    
    ["ONE SUMMER'S DAY"] = {
        ["ja"] = "あの夏へ"
    },
    
    ["KAMADO TANJIRO NO UTA"] = {
        ["ja"] = "竈門炭治郎のうた"
    },
    
    ["RENAI CIRCULATION"] = {
        ["ja"] = "恋愛サーキュレーション"
    },
    
    ["CHIISANA KOI NO UTA"] = {
        ["ja"] = "小さな恋のうた"
    },
    
    ["WHERE OUR BLUE IS"] = {
        ["ja"] = "青のすみか"
    },
    
    ["REFLECTIONS"] = {
        ["ja"] = "リフレクション"
    },
    
    ["AI♡SCREAM!"] = {
        ["ja"] = "愛♡スクリ～ム！"
    },

    ["A TALE OF SIX TRILLION YEARS AND A NIGHT"] = {
        ["ja"] = "六兆年と一夜物語"
    },

    ["PROPOSE (9LANA)"] = {
        ["ja"] = "プロポーズ"
    },

    ["SINKING TOWN"] = {
        ["ja"] = "沈める街"
    },

    [""] = {
        ["ja"] = ""
    },

    [""] = {
        ["ja"] = ""
    },

    [""] = {
        ["ja"] = ""
    },

    [""] = {
        ["ja"] = ""
    },

    [""] = {
        ["ja"] = ""
    },
}

getgenv().languages = getgenv().languages or {
    ["en"] = false,       -- English
    ["pt-BR"] = false,    -- Brazilian Portuguese
    ["es"] = false,       -- Spanish
    ["ru"] = false,       -- Russian
    ["zh-CN"] = false,    -- Chinese (Simplified / Mandarin)
    ["id"] = false,       -- Indonesian
    ["fil"] = false,      -- Filipino (Tagalog)
    ["vi"] = false,       -- Vietnamese
    ["fr"] = false,       -- French
    ["de"] = false,       -- German
    ["ja"] = false,       -- Japanese
    ["ko"] = false,       -- Korean
    ["tr"] = false,       -- Turkish
    ["ar"] = false        -- Arabic
}

local function setLanguage(lang)
    if getgenv().languages[lang] ~= nil then
        for k, v in pairs(getgenv().languages) do
            getgenv().languages[k] = false
        end
        getgenv().languages[lang] = true
        print("Language set to:", lang)
    else
        warn("Language not supported:", lang)
    end
    for k, v in pairs(getgenv().languages) do
        print(k, v)
    end
end


function translator:translateText(text)

    local activeLanguage

    if getgenv().languages then
        for lang, isActive in pairs(getgenv().languages) do
            if isActive then
                activeLanguage = lang
                break
            end
        end
    else
    end

    activeLanguage = activeLanguage or "en"

    if not translations then
        return text
    end

    if translations[text] then
        if translations[text][activeLanguage] then
            return translations[text][activeLanguage]
        else
        end
    else
    end

    return text -- fallback
end


local languageCodes = {
    ["en"] = "English",
    ["pt-BR"] = "Português (Brasil)",
    ["es"] = "Español",
    ["ru"] = "Русский",
    ["zh-CN"] = "中文",
    ["id"] = "Bahasa Indonesia",
    ["fil"] = "Filipino",
    ["vi"] = "Tiếng Việt",
    ["fr"] = "Français",
    ["de"] = "Deutsch",
    ["ja"] = "日本語",
    ["ko"] = "한국어",
    ["tr"] = "Türkçe",
    ["ar"] = "العربية"
}

function translator:requestLang(frame, type)

    local finished = false
    local selectedLanguage = "en"

    print("Checking for saved language...")
    
    local savedLang

    if type == "first" then
        local success, result = pcall(readfile, "TALENTLESS_language.txt")
        if success then
            savedLang = result
            print("Saved language:", savedLang)
            print("Language codes has this?", languageCodes[savedLang])

            if languageCodes[savedLang] then
                setLanguage(savedLang)
                return
            end
        else
            warn("Failed to read file: TALENTLESS_language.txt")
        end
    end


    local languageFrame = Instance.new("Frame")
    local uic1 = Instance.new("UICorner")
    local title = Instance.new("TextLabel")
    local uic2 = Instance.new("UICorner")
    local closeButton = Instance.new("TextButton")
    local languageSelection = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local whatLanguageTitle = Instance.new("TextLabel")
    local Proceed = Instance.new("TextButton")
    local DropdownFrame = Instance.new("Frame")
    local OpenSelector = Instance.new("TextButton")
    local DropdownArrow = Instance.new("TextButton")

    languageFrame.Name = "languageFrame"
    languageFrame.Parent = frame
    languageFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    languageFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 41)
    languageFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    languageFrame.Size = UDim2.new(0, 475, 0, 272)
    languageFrame.ZIndex = 50

    uic1.CornerRadius = UDim.new(0, 4)
    uic1.Name = "uic1"
    uic1.Parent = languageFrame

    title.Name = "title"
    title.Parent = languageFrame
    title.BackgroundColor3 = Color3.fromRGB(50, 57, 73)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.ZIndex = 2
    title.Font = Enum.Font.SourceSansBold
    title.Text = "TALENTLESS"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 46.000

    uic2.CornerRadius = UDim.new(0, 4)
    uic2.Name = "uic2"
    uic2.Parent = title

    closeButton.Name = "closeButton"
    closeButton.Parent = languageFrame
    closeButton.BackgroundTransparency = 1.000
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.ZIndex = 55
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextScaled = true

    closeButton.MouseButton1Click:Connect(function()
        finished = true
        languageFrame:Destroy()
        setLanguage(selectedLanguage)
    end)

    languageSelection.Name = "languageSelection"
    languageSelection.Parent = languageFrame
    languageSelection.Active = true
    languageSelection.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    languageSelection.BorderColor3 = Color3.fromRGB(0, 0, 0)
    languageSelection.BorderSizePixel = 0
    languageSelection.Position = UDim2.new(0.315999955, 0, 0.522058845, 0)
    languageSelection.Size = UDim2.new(0, 167, 0, 84)
    languageSelection.Visible = false
    languageSelection.ScrollBarThickness = 1

    UIListLayout.Parent = languageSelection
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    for code, name in pairs(languageCodes) do
        local button = Instance.new("TextButton")

        button.Name = "languageButton"
        button.Parent = languageSelection
        button.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
        button.BorderColor3 = Color3.fromRGB(64, 68, 90)
        button.LayoutOrder = 1
        button.Position = UDim2.new(0.0514285713, 0, 0, 0)
        button.Size = UDim2.new(0, 157, 0, 24)
        button.Font = Enum.Font.SourceSans
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextScaled = true
        button.TextSize = 26.000
        button.TextWrapped = true

        button.MouseButton1Click:Connect(function()
            OpenSelector.Text = name
            selectedLanguage = code
            languageSelection.Visible = false
        end)
    end

    UIPadding.Parent = languageSelection
    UIPadding.PaddingTop = UDim.new(0, 5)

    whatLanguageTitle.Name = "whatLanguageTitle"
    whatLanguageTitle.Parent = languageFrame
    whatLanguageTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    whatLanguageTitle.BackgroundTransparency = 1.000
    whatLanguageTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
    whatLanguageTitle.BorderSizePixel = 0
    whatLanguageTitle.Position = UDim2.new(0.105263159, 0, 0.231617644, 0)
    whatLanguageTitle.Size = UDim2.new(0, 374, 0, 31)
    whatLanguageTitle.Font = Enum.Font.SourceSansBold
    whatLanguageTitle.Text = "what language do you speak?"
    whatLanguageTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    whatLanguageTitle.TextScaled = true
    whatLanguageTitle.TextSize = 14.000
    whatLanguageTitle.TextWrapped = true

    Proceed.Name = "Proceed"
    Proceed.Parent = languageFrame
    Proceed.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
    Proceed.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Proceed.BorderSizePixel = 0
    Proceed.Position = UDim2.new(0.669473708, 0, 0.871323526, 0)
    Proceed.Size = UDim2.new(0, 157, 0, 35)
    Proceed.Font = Enum.Font.SourceSansBold
    Proceed.Text = "confirm"
    Proceed.TextColor3 = Color3.fromRGB(255, 255, 255)
    Proceed.TextSize = 28.000
    Proceed.TextWrapped = true

    Proceed.MouseButton1Click:Connect(function()
        pcall(function()
            writefile("TALENTLESS_language.txt", selectedLanguage)
        end)

        finished = true
        languageFrame:Destroy()
        setLanguage(selectedLanguage)
    end)

    DropdownFrame.Name = "DropdownFrame"
    DropdownFrame.Parent = languageFrame
    DropdownFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DropdownFrame.BackgroundTransparency = 1.000
    DropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    DropdownFrame.BorderSizePixel = 0
    DropdownFrame.Position = UDim2.new(0.316000015, 0, 0.400000006, 0)
    DropdownFrame.Size = UDim2.new(0, 175, 0, 35)

    OpenSelector.Name = "OpenSelector"
    OpenSelector.Parent = DropdownFrame
    OpenSelector.AnchorPoint = Vector2.new(0.5, 0.5)
    OpenSelector.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    OpenSelector.BorderColor3 = Color3.fromRGB(64, 68, 90)
    OpenSelector.BorderSizePixel = 2
    OpenSelector.Position = UDim2.new(0.388571441, 0, 0.5, 0)
    OpenSelector.Size = UDim2.new(0, 136, 0, 32)
    OpenSelector.Font = Enum.Font.SourceSansBold
    OpenSelector.Text = "English"
    OpenSelector.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenSelector.TextScaled = true
    OpenSelector.TextSize = 14.000
    OpenSelector.TextWrapped = true

    DropdownArrow.Name = "OpenSelector"
    DropdownArrow.Parent = DropdownFrame
    DropdownArrow.AnchorPoint = Vector2.new(0.5, 0.5)
    DropdownArrow.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    DropdownArrow.BorderColor3 = Color3.fromRGB(64, 68, 90)
    DropdownArrow.BorderSizePixel = 2
    DropdownArrow.Position = UDim2.new(0.868571401, 0, 0.5, 0)
    DropdownArrow.Size = UDim2.new(0, 32, 0, 32)
    DropdownArrow.Font = Enum.Font.SourceSansBold
    DropdownArrow.Text = "^"
    DropdownArrow.TextColor3 = Color3.fromRGB(255, 255, 255)
    DropdownArrow.TextScaled = true
    DropdownArrow.TextSize = 14.000
    DropdownArrow.TextWrapped = true

    OpenSelector.MouseButton1Click:Connect(function()
        languageSelection.Visible = not languageSelection.Visible
        if languageSelection.Visible then
            DropdownArrow.Text = "v"
        else
            DropdownArrow.Text = "^"
        end
    end)

    DropdownArrow.MouseButton1Click:Connect(function()
        languageSelection.Visible = not languageSelection.Visible
        if languageSelection.Visible then
            DropdownArrow.Text = "v"
        else
            DropdownArrow.Text = "^"
        end
    end)

    repeat wait() until finished
end

return translator
]=])()
local vu15 = getgenv().translator
local function vu17(p16)
    return vu15:translateText(p16)
end
local vu18 = game:GetService("TextService")
local function vu21(p19)
    local v20 = p19.TextSize
    while v20 > 1 and vu18:GetTextSize(p19.Text, v20, p19.Font, Vector2.new(math.huge, math.huge)).X > p19.AbsoluteSize.X do
        v20 = v20 - 1
        p19.TextSize = v20
    end
    return v20
end
getgenv().notiflib loadstring([=[local LibraryName = "Notification Library" -- yes
local NotificationLibrary = {}
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui") --plr.PlayerGui
local library
local templateFolder
local canvas
function NotificationLibrary:Load()
    library = game:GetObjects("rbxassetid://15133757123")[1]
    templateFolder = library.Templates
    canvas = library.list
    library.Name = LibraryName
    library.Parent = CoreGui
end
function NotificationLibrary:SendNotification(Mode, Text, Duration)
    local libaryCore = CoreGui:FindFirstChild(LibraryName)
    if not CoreGui:FindFirstChild(LibraryName) then
        NotificationLibrary:Load()
    else
        library = libaryCore
        templateFolder = library.Templates
        canvas = library.list
    end
    if templateFolder:FindFirstChild(Mode) then
        task.spawn(function()
            local success, err = pcall(function()
                local Notification = templateFolder:WaitForChild(Mode):Clone()
                local filler = Notification.Filler
                local bar = Notification.bar
                Notification.Header.Text = Text
                
                Notification.Visible = true
                Notification.Parent = canvas
    
                Notification.Size = UDim2.new(0, 0,0.087, 0)
                filler.Size = UDim2.new(1, 0,1, 0)
        
                local T1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                local T2 = TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
                local T3 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            
                TweenService:Create(Notification, T1, {Size = UDim2.new(1, 0,0.087, 0)}):Play()
                task.wait(0.2)
                TweenService:Create(filler, T3, {Size = UDim2.new(0.011, 0,1, 0)}):Play()
            
                TweenService:Create(bar, T2, {Size = UDim2.new(1, 0,0.05, 0)}):Play()
            
                task.wait(Duration)
            
                TweenService:Create(filler, T1, {Size = UDim2.new(1, 0,1, 0)}):Play()
                task.wait(0.25)
                TweenService:Create(Notification, T3, {Size = UDim2.new(0, 0,0.087, 0)}):Play()
                task.wait(0.25)
                Notification:Destroy()
            end)
            if not success then
                warn("There was an error while trying to create an notification!")
                warn(err)
            end
        end)
    else
        warn("Invalid theme applyed")
    end
end


return NotificationLibrary]=])()
local vu22 = getgenv().notiflib
local vu23 = "rbxassetid://94707254666920"
local vu24 = "rbxassetid://95485559387661"
local vu25 = "rbxassetid://131827423757726"
local vu26 = "rbxassetid://100154109194536"
game:GetService("ContentProvider"):PreloadAsync({
    vu23,
    vu24,
    vu25,
    vu26,
    "rbxassetid://70452176150315",
    "rbxassetid://1524549907",
    "rbxassetid://104269922408932",
    "rbxassetid://7383525713",
    "rbxassetid://18595195017"
})
local function vu30(p27, p28)
    local v29 = Instance.new("Sound")
    v29.SoundId = "rbxassetid://" .. p27
    v29.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer
    v29.Volume = p28 or 1
    v29:Play()
end
local vu31 = Instance.new("ScreenGui")
local vu32 = Instance.new("Frame")
local v33 = Instance.new("TextButton")
local v34 = Instance.new("TextButton")
local v35 = Instance.new("ImageButton")
local v36 = Instance.new("TextLabel")
local v37 = Instance.new("UICorner")
local v38 = Instance.new("UICorner")
local vu39 = Instance.new("ScrollingFrame")
local v40 = Instance.new("UIListLayout")
local v41 = Instance.new("UIPadding")
local vu42 = Instance.new("ScrollingFrame")
local v43 = Instance.new("UIListLayout")
local v44 = Instance.new("UIListLayout")
local v45 = Instance.new("UIPadding")
local v46 = Instance.new("UIPadding")
local v47 = Instance.new("TextLabel")
local vu48 = Instance.new("ScrollingFrame")
local vu49 = Instance.new("TextLabel")
local vu50 = Instance.new("TextBox")
local v51 = Instance.new("TextButton")
local v52 = Instance.new("TextButton")
local v53 = Instance.new("Frame")
local vu54 = Instance.new("TextBox")
local v55 = Instance.new("Frame")
local v56 = Instance.new("Frame")
local vu57 = Instance.new("ImageButton")
local vu58 = Instance.new("ImageButton")
local vu59 = Instance.new("Frame")
local vu60 = Instance.new("UIListLayout")
local v61 = Instance.new("UIPadding")
local v62 = Instance.new("ImageLabel")
local v63 = Instance.new("ImageLabel")
vu31.Parent = game:GetService("CoreGui")
vu31.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
vu32.Name = "frame"
vu32.Parent = vu31
vu32.BackgroundColor3 = Color3.fromRGB(33, 33, 41)
vu32.Position = UDim2.new(0.5, 0, 0.5, 0)
vu32.AnchorPoint = Vector2.new(0.5, 0.5)
vu32.Size = UDim2.new(0, 475, 0, 272)
v37.CornerRadius = UDim.new(0, 4)
v37.Name = "uic1"
v37.Parent = vu32
local v64 = vu15
vu15.requestLang(v64, vu32, "first")
v33.Name = "closeButton"
v33.Parent = vu32
v33.BackgroundTransparency = 1
v33.LayoutOrder = 1
v33.Position = UDim2.new(1, - 40, 0, 4)
v33.Size = UDim2.new(0, 35, 0, 35)
v33.ZIndex = 5
v33.Font = Enum.Font.SourceSansBold
v33.Text = "X"
v33.TextColor3 = Color3.fromRGB(255, 255, 255)
v33.TextScaled = true
v33.TextWrapped = true
v34.Name = "infoButton"
v34.Parent = vu32
v34.BackgroundTransparency = 1
v34.LayoutOrder = 2
v34.Position = UDim2.new(0, 5, 0, 4)
v34.Size = UDim2.new(0, 35, 0, 35)
v34.ZIndex = 5
v34.Font = Enum.Font.SourceSansBold
v34.Text = "?"
v34.TextColor3 = Color3.fromRGB(255, 255, 255)
v34.TextScaled = true
v34.TextWrapped = true
v35.Name = "changeLanguageButton"
v35.Parent = vu32
v35.BackgroundTransparency = 1
v35.LayoutOrder = 2
v35.Position = UDim2.new(0, 43, 0, 5)
v35.Size = UDim2.new(0, 35, 0, 35)
v35.ZIndex = 5
v35.Image = "rbxassetid://123593076590814"
v36.Name = "title"
v36.Parent = vu32
v36.BackgroundColor3 = Color3.fromRGB(50, 57, 73)
v36.Size = UDim2.new(1, 0, 0, 50)
v36.Font = Enum.Font.SourceSansBold
v36.Text = "TALENTLESS"
v36.TextColor3 = Color3.fromRGB(255, 255, 255)
v36.TextSize = 46
v36.ZIndex = 2
v38.CornerRadius = UDim.new(0, 4)
v38.Name = "uic2"
v38.Parent = v36
vu39.Name = "categoriesFrame"
vu39.Parent = vu32
vu39.Active = true
vu39.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
vu39.BackgroundTransparency = 1
vu39.Position = UDim2.new(0.0105263162, 0, 0.183819935, 0)
vu39.Size = UDim2.new(0, 111, 0, 222)
vu39.ZIndex = 0
vu39.ScrollBarThickness = 3
vu39.AutomaticCanvasSize = Enum.AutomaticSize.Y
v40.Name = "categoriesLayout"
v40.Parent = vu39
v40.SortOrder = Enum.SortOrder.LayoutOrder
v40.Padding = UDim.new(0, 10)
v40.HorizontalAlignment = Enum.HorizontalAlignment.Center
v41.Name = "categoriesPadding"
v41.Parent = vu39
v41.PaddingLeft = UDim.new(0, 5)
v41.PaddingRight = UDim.new(0, 5)
v41.PaddingTop = UDim.new(0, 5)
v41.PaddingBottom = UDim.new(0, 5)
vu42.Name = "scroll"
vu42.Parent = vu32
vu42.Active = true
vu42.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
vu42.BackgroundTransparency = 1
vu42.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu42.BorderSizePixel = 0
vu42.Position = UDim2.new(0.266860753, 0, 0.183819935, 0)
vu42.Size = UDim2.new(0, 198, 0, 222)
vu42.CanvasPosition = Vector2.new(0, 17.4999962)
vu42.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
vu42.ScrollBarThickness = 3
vu42.AutomaticCanvasSize = Enum.AutomaticSize.Y
v43.Name = "listLayout"
v43.Parent = vu42
v43.HorizontalAlignment = Enum.HorizontalAlignment.Center
v43.SortOrder = Enum.SortOrder.LayoutOrder
v43.Padding = UDim.new(0, 20)
v46.Name = "padding"
v46.Parent = vu42
v46.PaddingTop = UDim.new(0, 50)
v46.PaddingBottom = UDim.new(0, 20)
v53.Name = "searchframe"
v53.Parent = vu32
v53.BackgroundColor3 = Color3.fromRGB(33, 33, 41)
v53.BorderColor3 = Color3.fromRGB(0, 0, 0)
v53.BorderSizePixel = 0
v53.Position = UDim2.new(0.246315792, 0, 0.183823526, 0)
v53.Size = UDim2.new(0, 208, 0, 38)
vu54.Name = "searchbar"
vu54.Parent = v53
vu54.BackgroundColor3 = Color3.fromRGB(96, 102, 121)
vu54.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu54.BorderSizePixel = 0
vu54.Position = UDim2.new(0.158292323, 0, 0.278571635, 0)
vu54.Size = UDim2.new(0, 150, 0, 20)
vu54.Font = Enum.Font.SourceSansBold
vu54.PlaceholderText = vu17("search")
vu54.Text = ""
vu54.TextColor3 = Color3.fromRGB(255, 255, 255)
vu54.TextScaled = true
vu54.TextSize = 14
vu54.TextWrapped = true
v47.Name = "creds"
v47.Parent = vu32
v47.AnchorPoint = Vector2.new(0.5, 0.5)
v47.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v47.BackgroundTransparency = 1
v47.Position = UDim2.new(0.5, 0, 0.189999998, 0)
v47.Size = UDim2.new(0, 314, 0, 26)
v47.Font = Enum.Font.LuckiestGuy
v47.Text = "BY HELLOHELLOHELL012321"
v47.TextColor3 = Color3.fromRGB(255, 255, 255)
v47.TextSize = 14
v47.TextTransparency = 0.32
v47.ZIndex = 3
vu48.Name = "bar"
vu48.Parent = vu32
vu48.Active = true
vu48.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
vu48.BackgroundTransparency = 1
vu48.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu48.BorderSizePixel = 0
vu48.Position = UDim2.new(1.05001855, - 173, 0.20220229, 0)
vu48.Size = UDim2.new(0, 144, 0, 217)
vu48.ScrollBarThickness = 3
vu48.ZIndex = 0
vu48.AutomaticCanvasSize = Enum.AutomaticSize.Y
v44.Name = "barlist"
v44.Parent = vu48
v44.SortOrder = Enum.SortOrder.LayoutOrder
v44.Padding = UDim.new(0, 10)
v44.HorizontalAlignment = Enum.HorizontalAlignment.Center
v45.Name = "barpadding"
v45.Parent = vu48
v45.PaddingLeft = UDim.new(0, 5)
v45.PaddingRight = UDim.new(0, 5)
v45.PaddingTop = UDim.new(0, 10)
v45.PaddingBottom = UDim.new(0, 5)
vu49.Name = "songname"
vu49.Parent = vu48
vu49.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
vu49.BorderColor3 = Color3.fromRGB(64, 68, 90)
vu49.BorderSizePixel = 4
vu49.Position = UDim2.new(0.0689100027, 0, 0.0855299979, 0)
vu49.Size = UDim2.new(0, 125, 0, 34)
vu49.ZIndex = - 5
vu49.Font = Enum.Font.SourceSansBold
vu49.Text = vu17("songname")
vu49.TextColor3 = Color3.fromRGB(255, 255, 255)
vu49.TextScaled = true
vu49.TextSize = 23
vu49.TextWrapped = true
vu49.LayoutOrder = 1
vu50.Name = "bpmbox"
vu50.Parent = vu48
vu50.BackgroundColor3 = Color3.fromRGB(96, 102, 121)
vu50.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu50.BorderSizePixel = 0
vu50.Position = UDim2.new(0.163100004, 0, 0.612699986, 0)
vu50.Size = UDim2.new(0, 90, 0, 20)
vu50.Font = Enum.Font.SourceSansBold
vu50.PlaceholderText = "bpm"
vu50.Text = ""
vu50.TextColor3 = Color3.fromRGB(255, 255, 255)
vu50.TextScaled = true
vu50.TextSize = 14
vu50.TextWrapped = true
vu50.LayoutOrder = 2
v51.Name = "playsong"
v51.Parent = vu48
v51.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
v51.BorderColor3 = Color3.fromRGB(64, 68, 90)
v51.BorderSizePixel = 4
v51.Position = UDim2.new(0.0689100027, 0, 0.38815999, 0)
v51.Size = UDim2.new(0, 125, 0, 27)
v51.Font = Enum.Font.SourceSansBold
v51.Text = vu17("play song")
v51.TextColor3 = Color3.fromRGB(255, 255, 255)
v51.TextSize = 25
v51.LayoutOrder = 3
vu21(v51)
v56.Name = "songOptionsFrame"
v56.Parent = vu48
v56.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v56.BackgroundTransparency = 1
v56.BorderColor3 = Color3.fromRGB(0, 0, 0)
v56.BorderSizePixel = 0
v56.LayoutOrder = 4
v56.Position = UDim2.new(0.0300751887, 0, 0.822222233, 0)
v56.Size = UDim2.new(0, 125, 0, 38)
vu57.Parent = v56
vu57.BackgroundTransparency = 1
vu57.Position = UDim2.new(0.7, 0, 0, 0)
vu57.Size = UDim2.new(0, 38, 0, 38)
vu57.Image = vu23
vu58.Parent = v56
vu58.BackgroundTransparency = 1
vu58.BorderSizePixel = 0
vu58.Position = UDim2.new(0, 0, 0, 0)
vu58.Size = UDim2.new(0, 38, 0, 38)
vu58.Image = vu25
v55.Name = "barseperator"
v55.Parent = vu48
v55.BackgroundColor3 = Color3.fromRGB(64, 68, 90)
v55.LayoutOrder = 5
v55.Position = UDim2.new(- 0.251879692, 0, 1.17777777, 0)
v55.Size = UDim2.new(0, 137, 0, 8)
vu59.Name = "tagsFrame"
vu59.Parent = vu48
vu59.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vu59.BackgroundTransparency = 1
vu59.BorderColor3 = Color3.fromRGB(0, 0, 0)
vu59.BorderSizePixel = 0
vu59.LayoutOrder = 6
vu59.Position = UDim2.new(- 0.195488721, 0, 1.31851852, 0)
vu59.Size = UDim2.new(0, 137, 0, 157)
vu60.Name = "tagsListLayout"
vu60.Parent = vu59
vu60.FillDirection = Enum.FillDirection.Horizontal
vu60.SortOrder = Enum.SortOrder.LayoutOrder
vu60.Padding = UDim.new(0, 10)
vu60.Wraps = true
v61.Name = "tagsPadding"
v61.Parent = vu59
v61.PaddingBottom = UDim.new(0, 5)
v61.PaddingLeft = UDim.new(0, 5)
v61.PaddingRight = UDim.new(0, 5)
v62.Name = "snowpile"
v62.Parent = vu32
v62.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v62.BackgroundTransparency = 1
v62.BorderColor3 = Color3.fromRGB(0, 0, 0)
v62.BorderSizePixel = 0
v62.Position = UDim2.new(- 0.0149999997, 0, 0.716000021, 0)
v62.Size = UDim2.new(0, 202, 0, 192)
v62.Image = "rbxassetid://124461981242866"
v63.Name = "xmaslights"
v63.Parent = vu32
v63.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
v63.BackgroundTransparency = 1
v63.BorderColor3 = Color3.fromRGB(0, 0, 0)
v63.BorderSizePixel = 0
v63.Position = UDim2.new(- 0.0484210514, 0, 0.0147058824, 0)
v63.Size = UDim2.new(0, 520, 0, 100)
v63.ZIndex = 2
v63.Image = "rbxassetid://850806532"
v52.Name = "toggle"
v52.Parent = vu31
v52.BackgroundColor3 = Color3.fromRGB(50, 57, 73)
v52.BorderColor3 = Color3.fromRGB(64, 68, 90)
v52.BorderSizePixel = 4
v52.AnchorPoint = Vector2.new(0, 0.5)
v52.Position = UDim2.new(0, 0, 0.5, 0)
v52.Size = UDim2.new(0, 136, 0, 40)
v52.Font = Enum.Font.SourceSansBold
v52.Text = vu17("toggle ui")
v52.TextColor3 = Color3.fromRGB(255, 255, 255)
v52.TextScaled = true
v52.MouseButton1Click:Connect(function()
    vu32.Visible = not vu32.Visible
    if vu32.Visible then
        vu30(70452176150315, 0.1)
    else
        vu30(1524549907, 0.1)
    end
end)
v33.MouseButton1Click:Connect(function()
    vu31:Destroy()
    STOPLOOP = nil
    playingall = false
    vu30("104269922408932", 0.2)
end)
v34.MouseButton1Click:Connect(function()
    loadstring([=[local NotificationLibrary = getgenv().notiflib

local function playSound(soundId, loudness)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer
    sound.Volume = loudness or 1  -- Default to full volume if no loudness is provided
    sound:Play()
end

local translator = getgenv().translator

local function translateText(text)
    return translator:translateText(text) -- lang shouldve alr been set by main script.
end

local infogui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local copy = Instance.new("TextButton")
local desc = Instance.new("TextLabel")
local title = Instance.new("TextLabel")
local dismiss = Instance.new("TextButton")

infogui.Name = "infogui"
infogui.Parent = game:GetService("CoreGui")
infogui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = infogui
Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 41)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Size = UDim2.new(0, 285, 0, 269)
Frame.ZIndex = 99

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 15)

UIPadding.Parent = Frame
UIPadding.PaddingTop = UDim.new(0, 15)

copy.Name = "copy"
copy.Parent = Frame
copy.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
copy.BorderColor3 = Color3.fromRGB(64, 68, 90)
copy.BorderSizePixel = 4
copy.LayoutOrder = 3
copy.Position = UDim2.new(0.117543861, 0, 0.677165329, 0)
copy.Size = UDim2.new(0, 234, 0, 25)
copy.Font = Enum.Font.SourceSansBold
copy.Text = translateText("copy")
copy.TextColor3 = Color3.fromRGB(255, 255, 255)
copy.TextSize = 14.000
copy.TextWrapped = true

desc.Name = "desc"
desc.Parent = Frame
desc.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
desc.BorderColor3 = Color3.fromRGB(64, 68, 90)
desc.BorderSizePixel = 4
desc.LayoutOrder = 2
desc.Position = UDim2.new(0.0701754391, 0, 0.255905509, 0)
desc.Size = UDim2.new(0, 255, 0, 92)
desc.Font = Enum.Font.SourceSansBold
desc.Text = translateText("help info")
desc.TextColor3 = Color3.fromRGB(255, 255, 255)
desc.TextSize = 14.000
desc.TextWrapped = true

title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
title.BorderColor3 = Color3.fromRGB(64, 68, 90)
title.BorderSizePixel = 4
title.LayoutOrder = 1
title.Size = UDim2.new(0, 250, 0, 50)
title.Font = Enum.Font.SourceSansBold
title.Text = translateText("resources")
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 50.000
title.TextWrapped = true

dismiss.Name = "dismiss"
dismiss.Parent = Frame
dismiss.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
dismiss.BorderColor3 = Color3.fromRGB(64, 68, 90)
dismiss.BorderSizePixel = 4
dismiss.LayoutOrder = 3
dismiss.Position = UDim2.new(0.117543861, 0, 0.834645689, 0)
dismiss.Size = UDim2.new(0, 234, 0, 25)
dismiss.Font = Enum.Font.SourceSansBold
dismiss.Text = translateText("nevermind")
dismiss.TextColor3 = Color3.fromRGB(255, 255, 255)
dismiss.TextSize = 14.000
dismiss.TextWrapped = true

local UserInputService = game:GetService("UserInputService")

local gui = Frame

local dragging
local dragInput
local dragStart
local startPos
	
local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
	
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
	
gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)
	
UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
end
end)

copy.MouseButton1Click:Connect(function()
    setclipboard("https://www.hellohellohell0.com")
    NotificationLibrary:SendNotification("Success", translateText("linkcopied"), 5)
    playSound(6493287948, 0.1)
    wait(0.5)
    infogui:Destroy()
end)

dismiss.MouseButton1Click:Connect(function()
    infogui:Destroy()
end)
]=])()
end)
v35.MouseButton1Click:Connect(function()
    vu15:requestLang(vu32, "change")
    vu31:Destroy()
    STOPLOOP = nil
    playingall = false
    loadstring(game:HttpGet("https://hellohellohell0.com/talentless-raw/MAIN.lua", true))()
end)
local v65 = game:GetService("UserInputService")
local vu66 = v52
local vu67 = nil
local vu68 = nil
local vu69 = nil
local vu70 = nil
local function vu73(p71)
    local v72 = p71.Position - vu69
    vu66.Position = UDim2.new(vu70.X.Scale, vu70.X.Offset + v72.X, vu70.Y.Scale, vu70.Y.Offset + v72.Y)
end
vu66.InputBegan:Connect(function(pu74)
    if pu74.UserInputType == Enum.UserInputType.MouseButton1 or pu74.UserInputType == Enum.UserInputType.Touch then
        vu67 = true
        vu69 = pu74.Position
        vu70 = vu66.Position
        pu74.Changed:Connect(function()
            if pu74.UserInputState == Enum.UserInputState.End then
                vu67 = false
            end
        end)
    end
end)
vu66.InputChanged:Connect(function(p75)
    if p75.UserInputType == Enum.UserInputType.MouseMovement or p75.UserInputType == Enum.UserInputType.Touch then
        vu68 = p75
    end
end)
v65.InputChanged:Connect(function(p76)
    if p76 == vu68 and vu67 then
        vu73(p76)
    end
end)
local vu77 = false
if game.GameId == 3929033413 then
    local v78 = Instance.new("TextButton")
    local vu79 = Instance.new("TextButton")
    local v80 = Instance.new("TextLabel")
    v78.Name = "spoofMidiInfo"
    v78.Parent = vu32
    v78.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    v78.BorderColor3 = Color3.fromRGB(64, 68, 90)
    v78.BorderSizePixel = 2
    v78.LayoutOrder = 3
    v78.Position = UDim2.new(0.919436276, 0, 0.884484231, 0)
    v78.Size = UDim2.new(0, 23, 0, 23)
    v78.Font = Enum.Font.SourceSansItalic
    v78.Text = "?"
    v78.TextColor3 = Color3.fromRGB(255, 255, 255)
    v78.TextSize = 25
    v78.MouseButton1Click:Connect(function()
        loadstring([=[-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local title = Instance.new("TextLabel")
local uic2 = Instance.new("UICorner")
local info = Instance.new("TextLabel")
local closeButton = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")

local translator = getgenv().translator

local function translateText(text)
    return translator:translateText(text) -- lang shouldve alr been set by main script.
end

--Properties:

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 41)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.524622738, 0, 0.440348536, 0)
Frame.Size = UDim2.new(0, 384, 0, 296)

title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(50, 57, 73)
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Size = UDim2.new(1, 0, -0.0414047241, 50)
title.Font = Enum.Font.SourceSansBold
title.Text = translateText("spoof midi title")
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 32.000

uic2.CornerRadius = UDim.new(0, 4)
uic2.Name = "uic2"
uic2.Parent = title

info.Name = "info"
info.Parent = Frame
info.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
info.BorderColor3 = Color3.fromRGB(64, 68, 90)
info.BorderSizePixel = 4
info.LayoutOrder = 1
info.Position = UDim2.new(0.0480766296, 0, 0.620982587, 0)
info.Size = UDim2.new(0, 347, 0, 98)
info.Font = Enum.Font.SourceSans
info.Text = translateText("spoof midi info")
info.TextColor3 = Color3.fromRGB(255, 255, 255)
info.TextScaled = true
info.TextSize = 23.000
info.TextWrapped = true

closeButton.Name = "closeButton"
closeButton.Parent = Frame
closeButton.BackgroundTransparency = 1.000
closeButton.LayoutOrder = 1
closeButton.Position = UDim2.new(0.994791687, -35, -0.0121212117, 5)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.ZIndex = 5
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.TextWrapped = true

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.046875, 0, 0.176975965, 0)
ImageLabel.Size = UDim2.new(0, 258, 0, 204)
ImageLabel.ZIndex = 0
ImageLabel.Image = "rbxassetid://136739056545816"

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.75, 0, 0.14994894, 0)
TextLabel.Size = UDim2.new(0, 89, 0, 131)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = translateText("midi connect reminder")
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

closeButton.MouseButton1Click:Connect(
	function()
		ScreenGui:Destroy()
	end
)

-- drag script (not mince)

local UserInputService = game:GetService("UserInputService")

local gui = Frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    gui.Position =
        UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position

            input.Changed:Connect(
                function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end
            )
        end
    end
)

gui.InputChanged:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end
)

UserInputService.InputChanged:Connect(
    function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end
)
]=])()
    end)
    vu79.Name = "spoofMidi"
    vu79.Parent = vu32
    vu79.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    vu79.BackgroundTransparency = 1
    vu79.BorderColor3 = Color3.fromRGB(64, 68, 90)
    vu79.BorderSizePixel = 4
    vu79.LayoutOrder = 3
    vu79.Position = UDim2.new(0.68785733, 0, 0.899189472, 0)
    vu79.Size = UDim2.new(0, 103, 0, 15)
    vu79.Font = Enum.Font.SourceSansItalic
    vu79.Text = vu17("spoof midi") .. " [ ]"
    vu79.TextColor3 = Color3.fromRGB(255, 255, 255)
    vu79.TextSize = 23
    vu79.TextXAlignment = Enum.TextXAlignment.Left
    vu21(vu79)
    vu79.MouseButton1Click:Connect(function()
        vu77 = not vu77
        if vu77 then
            vu79.Text = vu17("spoof midi") .. " [x]"
            vu30(18595195017, 1)
            vu22:SendNotification("Success", vu17("midispoofon"), 5)
        else
            vu79.Text = vu17("spoof midi") .. " [ ]"
            vu30(18595195017, 1)
            vu22:SendNotification("Success", vu17("midispoofoff"), 5)
        end
    end)
    v80.Name = "underline"
    v80.Parent = vu79
    v80.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v80.BackgroundTransparency = 1
    v80.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v80.BorderSizePixel = 0
    v80.Position = UDim2.new(- 0.121739127, 0, - 0.0386352539, 0)
    v80.Size = UDim2.new(0, 102, 0, 22)
    v80.Font = Enum.Font.SourceSans
    v80.Text = "_____________"
    v80.TextColor3 = Color3.fromRGB(255, 255, 255)
    v80.TextSize = 14
end
local function vu95(p81)
    local v82 = p81:lower()
    vu42.CanvasPosition = Vector2.new(0, 0)
    local v83 = vu42
    local v84, v85, v86 = pairs(v83:GetChildren())
    while true do
        local v87
        v86, v87 = v84(v85, v86)
        if v86 == nil then
            break
        end
        if v87:IsA("TextButton") then
            if v87.Text == "+" or (v87 == PLAYRANDOM or (v87 == LOOPRANDOM or (v87 == PLAYPLAYLISTBUTTON or v87 == SHUFFLEPLAYLISTBUTTON))) then
                v87.Visible = false
            else
                local v88 = v87.Text:lower()
                local v89 = (v87:GetAttribute("AlternateNames") or ""):split(",")
                local v90 = false
                if v88:find(v82) then
                    v90 = true
                else
                    local v91, v92, v93 = pairs(v89)
                    while true do
                        local v94
                        v93, v94 = v91(v92, v93)
                        if v93 == nil then
                            break
                        end
                        if v90 == false then
                            if v94:lower():find(v82) then
                                v90 = true
                            end
                        end
                    end
                end
                v87.Visible = v90
            end
        elseif v87:IsA("Frame") and v87:FindFirstChildOfClass("TextButton") then
            v87.Visible = v87:FindFirstChildOfClass("TextButton").Text:lower():find(v82)
        end
    end
end
vu54:GetPropertyChangedSignal("Text"):Connect(function()
    vu95(vu54.Text)
end)
vu95("")
local v96 = game:GetService("UserInputService")
local vu97 = vu32
local vu98 = nil
local vu99 = nil
local vu100 = nil
local vu101 = nil
local function vu104(p102)
    local v103 = p102.Position - vu100
    vu97.Position = UDim2.new(vu101.X.Scale, vu101.X.Offset + v103.X, vu101.Y.Scale, vu101.Y.Offset + v103.Y)
end
vu97.InputBegan:Connect(function(pu105)
    if pu105.UserInputType == Enum.UserInputType.MouseButton1 or pu105.UserInputType == Enum.UserInputType.Touch then
        vu98 = true
        vu100 = pu105.Position
        vu101 = vu97.Position
        pu105.Changed:Connect(function()
            if pu105.UserInputState == Enum.UserInputState.End then
                vu98 = false
            end
        end)
    end
end)
vu97.InputChanged:Connect(function(p106)
    if p106.UserInputType == Enum.UserInputType.MouseMovement or p106.UserInputType == Enum.UserInputType.Touch then
        vu99 = p106
    end
end)
v96.InputChanged:Connect(function(p107)
    if p107 == vu99 and vu98 then
        vu104(p107)
    end
end)
local function v112(p108, p109)
    local v110 = Instance.new("TextButton")
    v110.Name = p108
    v110.Parent = vu42
    v110.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    v110.BorderColor3 = Color3.fromRGB(64, 68, 90)
    v110.BorderSizePixel = 4
    v110.Size = UDim2.new(0, 175, 0, 35)
    v110.Font = Enum.Font.SourceSansBold
    v110.Text = p108
    v110.TextColor3 = Color3.fromRGB(255, 255, 255)
    v110.TextSize = 27
    v110:SetAttribute("AlternateNames", table.concat(p109 or {}, ","))
    local v111 = Instance.new("ImageButton")
    v111.Parent = v110
    v111.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v111.BackgroundTransparency = 1
    v111.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v111.BorderSizePixel = 0
    v111.AnchorPoint = Vector2.new(0, 0.5)
    v111.Position = UDim2.new(0, 0, 0.5, 0)
    v111.Size = UDim2.new(0, 25, 0, 25)
    v111.Image = vu23
    v111.Visible = false
    v111.Name = "favButton"
    vu21(v110)
    return v110
end
LOOPRANDOM = v112(vu17("shuffle play songs"), {})
LOOPRANDOM.LayoutOrder = 1
PLAYRANDOM = v112(vu17("play random song"), {})
PLAYRANDOM.LayoutOrder = 1
local v113 = Instance.new("Frame")
v113.Name = "seperator"
v113.Parent = vu42
v113.BackgroundColor3 = Color3.fromRGB(64, 68, 90)
v113.Size = UDim2.new(0, 200, 0, 8)
v113.LayoutOrder = 2
A505 = v112("505", {
    "arctic monkeys",
    "artic monkeys"
})
A7_WEEKS_3_DAYS = v112("7 WEEKS & 3 DAYS", {})
A99DOT9 = v112("99.9", {
    "mob psycho 100"
})
A_CYBERS_WORLD = v112("A CYBER\'S WORLD?", {
    "toby fox"
})
A_SKY_FULL = v112("A SKY FULL OF STARS", {
    "coldplay"
})
A_THOUSAND = v112("A THOUSAND MILES", {
    "popular"
})
AFTER_DARK = v112("AFTER DARK", {
    "mr kitty"
})
ALL_GIRLS = v112("ALL GIRLS ARE THE SAME", {
    "juice wrld"
})
ALL_I_WANT_IS_YOU = v112("ALL I WANT IS YOU", {
    "rebzyyx"
})
ALL_MY_FELLAS = v112("ALL MY FELLAS", {})
ALL_THE_STARS = v112("ALL THE STARS", {
    "kendrick lamar",
    "sza",
    "black panther"
})
ALONE = v112("ALONE", {
    "marshmello"
})
ALTALE = v112(vu17("ALTALE"), {})
ENIGMATIC = v112("AN ENIGMATIC ENCOUNTER", {
    "undertale last breath",
    "toby fox"
})
ANNIHILATE = v112("ANNIHILATE", {
    "spider man",
    "spiderman",
    "spider-man",
    "metro boomin"
})
ANOTHER_LOVE = v112("ANOTHER LOVE", {
    "sad, love"
})
ANYONE_CAN = v112("ANYONE CAN BE FIND LOVE (except you.)", {
    "breakcore"
})
ARIA_MATH = v112("ARIA MATH", {
    "c418"
})
ARUARIAN = v112("ARUARIAN DANCE", {
    "nujabes"
})
AS_IT_WAS = v112("AS IT WAS", {
    "harry styles"
})
ASGORE = v112("ASGORE", {
    "toby fox"
})
ASSUMPTIONS = v112("ASSUMPTIONS", {})
ASTRONAMIA = v112("ASTRONAMIA (COFFIN DANCE)", {})
SPEED_OF = v112("AT THE SPEED OF LIGHT", {
    "gd"
})
ATTACK_OF_THE_KILLER_QUEEN = v112("ATTACK OF THE KILLER QUEEN", {
    "toby fox",
    "mrbeast",
    "phonk"
})
AVENGERS = v112("AVENGERS (EPIC COVER)", {
    "movie",
    "hard"
})
BAD_APPLE = v112("BAD APPLE!!", {})
BAD_HABIT = v112("BAD HABIT", {
    "steve lacy"
})
BAD_PIGGIES = v112("BAD PIGGIES", {
    "angry birds"
})
BATTLE_AGAINST = v112("BATTLE AGAINST A TRUE HERO", {})
BEANIE = v112("BEANIE", {
    "beanie chezile"
})
BEAUTIFUL_THINGS = v112("BEAUTIFUL THINGS", {
    "benson boone"
})
BEETHOVEN_VIRUS = v112("BEETHOVEN VIRUS", {
    "ludwig van beethoven"
})
BELIEVER = v112("BELIEVER", {
    "imagine dragons"
})
BELLA_CIAO = v112("BELLA CIAO", {})
BIG_FISH = v112("BIG FISH (\229\164\167\233\177\188)", {})
BIG_SHOT = v112("BIG SHOT", {
    "toby fox"
})
BIRDS_OF_A = v112("BIRDS OF A FEATHER", {
    "billie eilish"
})
BLINDING_LIGHTS = v112("BLINDING LIGHTS", {
    "the weeknd"
})
BLOODY = v112("BLOODY MARY", {
    "lady gaga",
    "wednesday"
})
BLUE = v112("BLUE (DA BA DEE)", {
    "im blue",
    "im good"
})
BLUE_YUNG = v112("BLUE (YUNG KAI)", {})
BOHEMIAN_RHAPSODY = v112("BOHEMIAN RHAPSODY", {
    "queen"
})
BREADY = v112("BREADY, SET, GO!", {})
BY_YOUR_SIDE = v112("BY YOUR SIDE", {})
CAN_YOU_HEAR = v112("CAN YOU HEAR THE MUSIC", {
    "oppenheimer",
    "popular"
})
CAN_YOU_HEAR_EPIC = v112("CAN YOU HEAR THE MUSIC (EPIC VER.)", {
    "hans zimmer",
    "oppenheimer"
})
CANDYLAND = v112("CANDYLAND", {
    "tobu",
    "ncs",
    "no copyright sounds"
})
CANON_D = v112("CANON IN D", {})
CANT_LET = v112("CANT LET GO", {
    "gd"
})
CARELESS = v112("CARELESS WHISPER", {})
CAROL_OF_THE_BELLS = v112("CAROL OF THE BELLS", {
    "christmas"
})
CAROL_OF_THE_BELLS_EPIC = v112("CAROL OF THE BELLS (EPIC VER.)", {
    "christmas",
    "peter buka"
})
CENTIMETER = v112(vu17("CENTIMETER"), {
    "rent a girlfriend",
    "rent-a-girlfriend"
})
CHAOS_KING = v112("CHAOS KING", {
    "toby fox"
})
CHRISTMAS_KIDS = v112("CHRISTMAS KIDS", {
    "roar"
})
CLAIR_DE_LUNE = v112("CLAIR DE LUNE", {
    "debussy"
})
CLOCKS = v112("CLOCKS", {
    "coldplay"
})
CLOUD_9 = v112("CLOUD 9", {
    "tobu",
    "ncs",
    "no copyright sounds"
})
CLUBSTEP = v112("CLUBSTEP", {
    "dj nate",
    "gd"
})
COCONUT = v112("COCONUT MALL !!", {
    "mario kart",
    "nintendo"
})
COMPTINE_DUN_AUTRE_ETE = v112("COMPTINE D\'UN AUTRE \195\137T\195\137", {
    "yann tiersen",
    "amelie"
})
COUNTING_STARS = v112("COUNTING STARS", {
    "one republic"
})
CRAB_RAVE = v112("CRAB RAVE", {
    "no copyright sounds",
    "ncs",
    "noisestorm"
})
CRADLES = v112("CRADLES", {
    "ncs",
    "no copyright sounds",
    "sub urban"
})
CREEP = v112("CREEP", {
    "radiohead"
})
CROSSING_FIELD = v112("CROSSING FIELD", {
    "sword art online",
    "sao"
})
CUPID = v112("CUPID", {
    "love"
})
DAISY_BELL = v112("DAISY BELL", {})
DAMNED = v112("DAMNED (COD ZOMBIES)", {
    "cod zombies theme",
    "call of duty",
    "creepy"
})
DARK_BEACH = v112("DARK BEACH", {
    "pastel ghost"
})
DAWN_OF = v112("DAWN OF THE DOORS", {
    "doors",
    "roblox",
    "lsplash"
})
DAYLIGHT = v112("DAYLIGHT", {
    "david kushner"
})
DEADLOCKED = v112("DEADLOCKED", {
    "gd"
})
DEATH_BED = v112("DEATH BED", {
    "powfu",
    "beabadoobee"
})
DESPACITO = v112("DESPACITO", {})
DEXTER_BLOOD_THEME = v112("DEXTER - BLOOD THEME", {})
DETROIT = v112("DETROIT: BECOME HUMAN - OPENING", {})
DIE_WITH = v112("DIE WITH A SMILE", {
    "lady gaga",
    "bruno mars"
})
DIES_IRAE = v112("DIES IRAE (MESSA DA REQUIEM)", {
    "giuseppe verdi"
})
DIE_IRAE_III = v112("DIES IRAE (REQUIEM MVT.3)", {
    "mozart"
})
DIES_IRAE_III_2 = v112("DIES IRAE (REQUIEM MVT.3) (EPIC VER.)", {
    "mozart",
    "epic"
})
DOG_SONG = v112("DOG SONG", {})
DONT_STOP = v112("DONT STOP BELIEVIN\'", {
    "journey"
})
DRAMAM = v112("DRAMAMIME", {
    "flawed mangoes"
})
DREAM_FL = v112("DREAM FLOWER", {
    "klydix"
})
DREAM_ON = v112("DREAM ON", {
    "aerosmith"
})
DROWNING_LOVE = v112("DROWNING LOVE", {
    "chasing kou"
})
DRY_HANDS = v112("DRY HANDS", {
    "c418"
})
DUMB_DUMB = v112("DUMB DUMB", {
    "everyone is dumb"
})
DUVET = v112("DUVET", {
    "boa"
})
EASY_ON_ME = v112("EASY ON ME", {
    "adele"
})
ELEVATOR_JAM = v112("ELEVATOR JAM", {
    "doors",
    "roblox",
    "lsplash"
})
ELEVATOR_JAM_2 = v112("ELEVATOR JAM x HERE I COME", {
    "doors",
    "roblox",
    "lsplash"
})
ENEMY = v112("ENEMY", {
    "imagine dragons",
    "arcane"
})
ENTRY_OF_THE = v112("ENTRY OF THE GLADIATORS", {
    "circus",
    "clown"
})
ERIKA = v112("ERIKA", {
    "nazi",
    "hitler",
    "german",
    "ww2",
    "world war 2"
})
ETHEREAL = v112("ETHEREAL", {
    "txmy"
})
EVERGREEN = v112("EVERGREEN", {})
EXPERIENCE = v112("EXPERIENCE", {})
EXPERIENCE_FLOWS = v112("EXPERIENCE FLOWS IN YOU", {
    "tony ann",
    "river flows in you"
})
FADED = v112("FADED", {
    "ncs",
    "alan walker",
    "no copyright sounds"
})
FALLEN_DOWN = v112("FALLEN DOWN", {})
FANTAISIE = v112("FANTAISIE IMPROMPTU", {
    "frederic chopin"
})
FIELD_OF_HOPES_AND_DREAMS = v112("FIELD OF HOPES AND DREAMS", {
    "toby fox"
})
FIELD_OF_MEMORIES = v112("FIELD OF MEMORIES", {
    "waterflame",
    "stick war"
})
FINAL_DUET = v112("FINAL DUET", {
    "omori"
})
FINALE = v112("FINALE", {
    "toby fox",
    "flowey"
})
FIVE_NIGHTS_1 = v112("FIVE NIGHTS AT FREDDYS 1", {
    "fnaf",
    "five nights at freddys",
    "the living tombstone"
})
FLARE = v112("FLARE", {
    "hensonn",
    "sahara",
    "phonk"
})
FLASHING = v112("FLASHING LIGHTS", {
    "kanye west",
    "graduation"
})
FLY_ME_TO_THE_MOON = v112("FLY ME TO THE MOON", {
    "frank sinatra",
    "love",
    "squid game",
    "jazz"
})
FOR_THE_DAMAGED_CODA = v112("FOR THE DAMAGED CODA", {
    "evil morty",
    "rick and morty",
    "rick & morty"
})
FOR_THE_DAMAGED_CODA_2 = v112("FOR THE DAMAGED CODA (EPIC VER.)", {
    "evil morty",
    "rick and morty",
    "rick & morty"
})
FREAKS = v112("FREAKS", {
    "surf curse"
})
FREEDOM_DIVE = v112("FREEDOM DIVE", {
    "xi"
})
FRIENDS = v112("FRIENDS", {
    "marshmello",
    "anne marie"
})
FR = v112("FROM THE START", {
    "laufey",
    "love",
    "popular"
})
FUKASHIGI = v112(vu17("FUKASHIGI NO CARTE"), {
    "senpai"
})
FUR_ELISE = v112("FUR ELISE", {
    "ludwig van beethoven",
    "classical"
})
GANGSTAS_PARADISE = v112("GANGSTA\'S PARADISE", {
    "coolio"
})
GEOMETRY_DASH = v112("GEOMETRY DASH THEME (DASH)", {
    "gd"
})
GIORNO = v112(vu17("GIORNO\'S THEME"), {
    "giornos theme",
    "jojo",
    "jojo\'s bizarre adventure"
})
GLASSY_SKY = v112("GLASSY SKY", {
    "tokyo ghoul"
})
GODS_PLAN = v112("GODS PLAN", {
    "drake"
})
GOLDENHOUR = v112("GOLDEN HOUR", {
    "jvke",
    "love, sad",
    "popular"
})
GOOD_MORNING = v112("GOOD MORNING (OMORI)", {
    "omori"
})
GOOFY_AHH = v112("GOOFY AHH NPC MUSIC", {
    "whistle"
})
GRAVITY_FALLS = v112("GRAVITY FALLS", {})
GURENGE = v112(vu17("GURENGE"), {
    "lisa",
    "demon slayer"
})
GYPSY_WOMAN = v112("GYPSY WOMAN", {
    "crystal waters",
    "slickback",
    "slick back",
    "gipsy woman"
})
HAGGSTORM = v112("HAGGSTORM", {
    "c418"
})
HAPPIER = v112("HAPPIER", {
    "marshmello",
    "bastille"
})
HATSUNE_MIKU_NO_GEKISHOU = v112("HATSUNE MIKU NO GEKISHOU (\230\191\128\229\148\177)", {
    "hatsune miku",
    "vocaloid",
    "miku",
    "colorful stage",
    "project sekai"
})
HAZY_MOON = v112("HAZY MOON", {
    "minato",
    "hatsune miku"
})
HEART_AFIRE = v112("HEART AFIRE", {
    "defqwop"
})
HEARTACHE = v112("HEARTACHE", {})
HEAT_WAVE = v112("HEAT WAVE", {
    "glass animals"
})
HEATHENS = v112("HEATHENS", {
    "twenty one pilots",
    "suicide squad"
})
HELLO = v112("HELLO X I LOVE YOU", {
    "omfg"
})
HERE_I_COME = v112("HERE I COME", {
    "doors",
    "roblox",
    "lsplash"
})
HERE_WITH = v112("HERE WITH ME", {
    "d4vd",
    "romantic homicide"
})
HES_A_PIRATE = v112("HES A PIRATE", {
    "hans zimmer",
    "pirates of the caribbean"
})
HIGH_HOPES = v112("HIGH HOPES", {
    "panic at the disco",
    "panic!",
    "house of memories"
})
HIMITSU_KOI_GOKORO = v112(vu17("HIMITSU KOI GOKORO"), {
    "rent a girlfriend",
    "rent-a-girlfriend",
    "honeyworks"
})
LENAI = v112("REN\'AI (\227\131\172\227\131\179\227\130\162\227\130\164)", {
    "rent a girlfriend",
    "rent-a-girlfriend",
    "lenai",
    "renai"
})
HH = v112("HH", {
    "kanye west",
    "heil hitler"
})
HIS_THEME = v112("HIS THEME", {})
HIT_THE_ROAD = v112("HIT THE ROAD, JACK", {
    "shake"
})
HOPE = v112("HOPE", {
    "xxxtentacion"
})
HOPES_DREAMS = v112("HOPES AND DREAMS", {
    "asriel"
})
HOTLINE_BLING = v112("HOTLINE BLING", {
    "drake"
})
HOUSE_OF = v112("HOUSE OF MEMORIES", {
    "panic at the disco",
    "panic!",
    "high hopes"
})
HOWLS_MOVING_CASTLE = v112(vu17("MERRY-GO-ROUND OF LIFE"), {
    "howls moving castle",
    "howl\'s moving castle",
    "merry-go-round",
    "ghibli"
})
HOWLS_MOVING_CASTLE_2 = v112(vu17("MERRY-GO-ROUND OF LIFE") .. " - ANIMENZ", {
    "howls moving castle",
    "howl\'s moving castle",
    "merry-go-round",
    "ghibli"
})
HUNGARIAN = v112("HUNGARIAN DANCE", {})
I_LIKE_THE_WAY_YOU = v112("I LIKE THE WAY YOU KISS ME", {
    "artemis"
})
I_REALLY_WANT_TO_STAY = v112("I REALLY WANT TO STAY AT YOUR HOUSE", {
    "cyberpunk"
})
I_WANT = v112("I WANT IT THAT WAY", {
    "backstreet boys"
})
SURVIVE = v112("I WILL SURVIVE", {})
ICARUS = v112("ICARUS", {
    "tony ann"
})
IDEA_10 = v112("IDEA 10", {
    "gibran alcocers"
})
IDGAF = v112("IDGAF", {
    "boywithuke",
    "blackbear"
})
IDOL = v112("IDOL", {
    "oshi no ko",
    "yoasobi"
})
IDOL_EPIC = v112("IDOL (EPIC VER.)", {
    "oshi no ko",
    "yoasobi"
})
IF_I_AM_WITH_YOU = v112("IF I AM WITH YOU", {
    "jjk",
    "jujutsu kaisen",
    "hollow purple",
    "the honored one",
    "gojo satoru",
    "premature death"
})
IM_NOT_THE_ONLY_ONE = v112("IM NOT THE ONLY ONE", {
    "sam smith"
})
IM_STILL = v112("IM STILL STANDING", {
    "sing",
    "elton john"
})
IMMORTAL = v112("IMMORTAL", {
    "playboi carti"
})
IN_THE_NAME = v112("IN THE NAME OF LOVE", {})
INSANE = v112("INSANE", {
    "hazbin hotel"
})
INTERSTELLAR = v112("INTERSTELLAR", {
    "hans zimmer",
    "cinematic",
    "movie",
    "popular"
})
INVISIBLE = v112("INVISIBLE (EDM)", {
    "ncs",
    "no copyright sounds"
})
ISABELLA = v112("ISABELLA\'S LULLABY", {})
ISOLATION = v112("ISOLATION", {
    "limbo",
    "gd"
})
IT_MEANS = v112("IT MEANS EVERYTHING", {})
ITS_BEEN_SO = v112("ITS BEEN SO LONG", {
    "the living tombstone",
    "five nights at freddys",
    "fnaf"
})
ITS_JUST_A_BURNING = v112("ITS JUST A BURNING MEMORY", {
    "the care taker",
    "the caretaker"
})
ITS_RAINING = v112("ITS RAINING TACOS", {})
JOCELYN_FLORES = v112("JOCELYN FLORES", {
    "xxxtentacion"
})
KAWAIKUTEGOMEN = v112(vu17("KAWAIKUTEGOMEN"), {
    "honeyworks",
    "sorry for being so cute",
    "kawaikutegomen"
})
KEROSENE = v112("KEROSENE", {
    "popular"
})
KEY = v112("KEY", {
    "c418"
})
L = v112(vu17("L\'S THEME"), {
    "death note",
    "ls theme"
})
LAVENDER_TOWN = v112("LAVENDER TOWN", {
    "pokemon"
})
LA_CAMPANELLA = v112("LA CAMPANELLA", {
    "etude",
    "franz liszt"
})
LACRIMOSA = v112("LACRIMOSA (REQUIEM MVT.8)", {
    "mozart",
    "noot noot"
})
LALALA = v112("LALALA", {
    "bbno"
})
LET_IT_HAPPEN = v112("LET IT HAPPEN", {
    "tame impala"
})
LET_ME_DOWN_SLOWLY = v112("LET ME DOWN SLOWLY", {
    "alec benjamin"
})
LET_ME_LOVE = v112("LET ME LOVE YOU", {
    "justin bieber",
    "dj snake"
})
LEVAN_POLKKA = v112("LEVAN POLKKA", {
    "hatsune miku",
    "vocaloid",
    "le van"
})
LEVELS = v112("LEVELS", {
    "avicii"
})
LIEBESTRAUM_NO3 = v112("LIEBESTRAUM NO.3", {
    "franz liszt"
})
LIGHT_SWITCH = v112("LIGHT SWITCH", {
    "charlie puth"
})
LIGHTS = v112(vu17("LIGHT\'S THEME"), {
    "death note",
    "lights theme"
})
LIVING_MICE = v112("LIVING MICE", {
    "c418"
})
LOST_LIBRARY = v112("LOST LIBRARY", {
    "omori"
})
LOST_UMB = v112(vu17("LOST UMBRELLA"), {
    "cute depressed",
    "vocaloid",
    "inabakumori"
})
LOVE = v112("LOVE (W2E)", {
    "wave to earth",
    "love."
})
LOVELY_B = v112("LOVELY BASTARDS", {
    "phonk"
})
LUTHER = v112("LUTHER", {
    "kendrick lamar",
    "sza",
    "GNX"
})
LUX_AETERNA = v112("LUX AETERNA (REQUIEM FOR A DREAM)", {
    "clint mansell"
})
MA_MEILLEUR = v112("MA MEILLEUR ENEMIE", {
    "stromae",
    "arcane"
})
MAGICAL_CURE = v112("M@GICAL CURE! LOVE SHOT!", {
    "miku",
    "vocaloid",
    "hatsune miku",
    "magical cure"
})
MARI_BOSS = v112("MARI BOSS FIGHT", {
    "omori"
})
MARRIED = v112("MARRIED LIFE", {
    "movie",
    "up"
})
MARY_ON = v112("MARY ON A CROSS", {})
MASTER_OF_PUPPETS = v112("MASTER OF PUPPETS", {
    "metallica"
})
MEGALOVANIA = v112("MEGALOVANIA", {
    "popular"
})
METAMORPH = v112("METAMORPHOSIS", {
    "phonk"
})
MICE_ON = v112("MICE ON VENUS", {
    "c418"
})
MICHAEL_MYERS = v112("MICHAEL MYERS", {
    "halloween"
})
MIDDLE_OF_THE_NIGHT = v112("MIDDLE OF THE NIGHT", {
    "elley duhe"
})
MII = v112("MII CHANNEL THEME", {
    "wii"
})
MIKU = v112("MIKU", {
    "vocaloid"
})
MINECRAFT = v112("MINECRAFT", {
    "c418"
})
MINGLE = v112("MINGLE (ROUND AND ROUND)", {
    "squid game"
})
MONODY = v112("MONODY", {
    "ncs",
    "no copyright sounds",
    "thefatrat"
})
MONTAGEM_TOMADA = v112("MONTAGEM TOMADA", {
    "phonk"
})
MOOD = v112("MOOD", {
    "24kgoldn"
})
MOOG_CITY = v112("MOOG CITY", {
    "c418"
})
MOONLIGHT = v112("MOONLIGHT SONATA - FIRST MOVEMENT", {
    "ludwig van beethoven"
})
M3 = v112("MOONLIGHT SONATA - THIRD MOVEMENT", {
    "ludwig van beethoven"
})
MY_CASTLE_TOWN = v112("MY CASTLE TOWN", {
    "toby fox"
})
MY_EYES = v112("MY EYES", {
    "travis scott",
    "utopia"
})
MY_HEART_WILL_GO_ON = v112("MY HEART WILL GO ON", {
    "titanic",
    "celine dion"
})
MY_LOVE_ALL_MINE = v112("MY LOVE MINE ALL MINE", {
    "mitski"
})
MY_ORDINARY_LIFE = v112("MY ORDINARY LIFE", {
    "the living tombstone"
})
GIVE_UP = v112("NEVER GONNA GIVE YOU UP", {
    "rick astley",
    "rickroll",
    "rick roll"
})
NEVER_MEANT = v112("NEVER MEANT TO BELONG", {
    "bleach"
})
NO_SURPRISES = v112("NO SURPRISES", {
    "radiohead"
})
NOCTURNE = v112("NOCTURNE OP.9 NO.2", {
    "frederic chopin"
})
NOPE_YOUR_TOO_LATE = v112("NOPE YOUR TOO LATE I ALREADY DIED", {
    "wifiskeleton"
})
NOTHING_ELSE_MATTERS = v112("NOTHING ELSE MATTERS", {
    "metallica"
})
NOT_A_SLACKER = v112("NOT A SLACKER ANYMORE", {})
NOT_LIKE_US = v112("NOT LIKE US", {
    "kendrick lamar",
    "drake"
})
NOTION = v112("NOTION", {
    "the rare occasions"
})
NUMBERS = v112("NUMBERS", {
    "temporex"
})
NYAN_CAT = v112("NYAN CAT", {})
NYEH = v112("NYEH HEH HEH!", {
    "papyrus"
})
OBLIVION = v112("OBLIVION (GRIMES)", {
    "grimes"
})
OLD_DOLL = v112("OLD DOLL", {
    "mad father"
})
OLD_TOWN_ROAD = v112("OLD TOWN ROAD", {
    "lil nas x"
})
ONCE_UPON = v112("ONCE UPON A TIME", {})
ONE_DANCE = v112("ONE DANCE", {
    "drake",
    "wizkid",
    "kyla"
})
ORDER = v112("ORDER (ULTRAKILL)", {
    "minos prime bossfight"
})
ORDINARY = v112("ORDINARY", {
    "alex warren"
})
OVERTAKEN = v112(vu17("OVERTAKEN"), {
    "one piece"
})
PARADISE = v112("PARADISE", {
    "coldplay"
})
PASSACAGLIA = v112("PASSACAGLIA, SUITE NO.7", {})
PASSO_BEM_SOLTO = v112("PASSO BEM SOLTO", {
    "phonk"
})
PAST_LIVES = v112("PAST LIVES", {})
PATHETIQUE = v112("SONATE OP.13 NO.8 (PATH\195\137TIQUE)", {
    "ludwig van beethoven",
    "sonata pathetique"
})
PAYPHONE = v112("PAYPHONE", {
    "maroon 5"
})
PEACHES = v112("PEACHES", {
    "jack black",
    "bowser",
    "super mario bros"
})
PLANT_VS_ZOMBIES = v112("PLANT VS ZOMBIES", {
    "pvz"
})
PLEAD = v112("PLEAD (FORSAKEN)", {
    "roblox forsaken",
    "last man standing",
    "c00lkidd",
    "key after key",
    "007n7"
})
POKEMON = v112("POKEMON MAIN THEME", {})
POKEMON_RED = v112("POKEMON RED AND BLUE", {})
PRAYER = v112("PRAYER", {
    "kendrick lamar",
    "damn"
})
PRELUDE_NO2 = v112("BACH - PRELUDE NO.2", {
    "johann sebastian bach"
})
PRELUDE_OP28 = v112("CHOPIN - PRELUDE OP.28 NO.4", {
    "frederic chopin"
})
RACING_INTO = v112(vu17("RACING INTO THE NIGHT"), {
    "yoasobi"
})
RAIN = v112("RAIN", {
    "tony ann"
})
RATDANCE = v112("RAT DANCE", {
    "chess"
})
READY_OR_NOT = v112("READY OR NOT (FORSAKEN)", {
    "c00lkidd chase",
    "roblox forsaken",
    "key after key"
})
RESONANCE = v112("RESONANCE", {
    "home"
})
REVOLUTIONARY = v112("ETUDE OP.10 NO.12 (REVOLUTIONARY)", {
    "frederic chopin"
})
RIGHTEOUS = v112("RIGHTEOUS (MO BEATS)", {})
RIPTIDE = v112("RIPTIDE", {
    "vance joy"
})
RISE_UP = v112("RISE UP", {
    "thefatrat",
    "ncs",
    "no copyright sounds"
})
RISES_THE = v112("RISES THE MOON", {
    "liana flores"
})
RIVER_FLOWS = v112("RIVER FLOWS IN YOU", {})
ROMANTIC_HOMICIDE = v112("ROMANTIC HOMICIDE", {
    "dv4d",
    "here with me"
})
RUDE_BUSTER = v112("RUDE BUSTER", {
    "toby fox"
})
RUINS = v112("RUINS", {})
RUNAWAY = v112("RUNAWAY", {
    "kanye",
    "popular",
    "rap",
    "hip"
})
RUNAWAY_AURORA = v112("RUNAWAY (AURORA)", {})
RUNNING_UP = v112("RUNNING UP THAT HILL", {
    "stranger things"
})
RUSH_C = v112("RUSH C", {
    "sheet music boss"
})
RUSHE = v112("RUSH E", {
    "sheet music boss"
})
RUSH_F = v112("RUSH F", {
    "sheet music boss"
})
RUSH_G = v112("RUSH G", {
    "sheet music boss"
})
RUSH_OF_LIFE = v112("RUSH OF LIFE", {
    "tony ann"
})
SAILOR_SONG = v112("SAILOR SONG", {
    "gianna perez"
})
SANS = v112("SANS.", {
    "undertale"
})
SAVE_YOUR = v112("SAVE YOUR TEARS", {
    "weeknd"
})
SCARLET_FOREST = v112("SCARLET FOREST", {
    "toby fox"
})
SEE_YOU_AGAIN = v112("SEE YOU AGAIN (TYLER THE CREATOR)", {
    "tyler the creator",
    "kali urchis",
    "tyler, the creator",
    "flower boy"
})
SEE_YOU_AGAIN_CHARLIE = v112("SEE YOU AGAIN (CHARLIE PUTH)", {
    "charlie puth",
    "wiz khalifa"
})
SHAPE_OF = v112("SHAPE OF YOU", {
    "ed sheeran"
})
SHIAWASE = v112("SHIAWASE (VIP)", {
    "tidal wave",
    "gd"
})
SHIKAIRO = v112(vu17("SHIKAIRO DAYS"), {
    "my dear friend nokotan",
    "my deer friend nokotan"
})
SHOP = v112("SHOP", {})
SICK_OF_U = v112("SICK OF U", {
    "boywithuke"
})
SILHOUETTE = v112(vu17("SILHOUETTE"), {
    "naruto shippuden"
})
SKELETAL_SHENANIGANS = v112("SKELETAL SHENANIGANS", {
    "gd"
})
SKYFALL = v112("SKYFALL", {
    "adele"
})
SLAY = v112("SLAY", {
    "eternxlz",
    "phonk"
})
SNOWFALL = v112("SNOWFALL", {
    "oneheart"
})
SNOWY = v112("SNOWY", {})
SOLAS = v112("SOLAS", {
    "sad"
})
SOMEBODY_THAT_I_USED = v112("SOMEBODY THAT I USED TO KNOW", {
    "gotye"
})
SOMETHING_JUST = v112("SOMETHING JUST LIKE THIS", {
    "the chainsmokers"
})
SONG_THAT_MIGHT = v112("SONG THAT MIGHT PLAY WHEN YOU FIGHT SANS", {
    "undertale"
})
SOVIET_UNION_ANTHEM = v112("SOVIET UNION ANTHEM", {})
SPACE_SONG = v112("SPACE SONG", {
    "beach house"
})
SPARKLE = v112(vu17("SPARKLE"), {
    "radwimps",
    "your name",
    "kimi no na wa"
})
SPEAR_OF = v112("SPEAR OF JUSTICE", {})
SPECTRE = v112("SPECTRE", {
    "alan walker",
    "ncs",
    "no copyright sounds",
    "smurf cat"
})
SPIDER_DANCE = v112("SPIDER DANCE", {
    "muffet",
    "toby fox"
})
STAY = v112("STAY", {
    "justin bieber",
    "kid laroi"
})
STEREO_HEARTS = v112("STEREO HEARTS", {
    "gym class heroes",
    "adam levine"
})
STEREO_MADNESS = v112("STEREO MADNESS", {
    "gd"
})
STRANGER_THINGS = v112("STRANGER THINGS", {})
STRESSED_OUT = v112("STRESSED OUT", {
    "twenty one pilots",
    "21 pilots",
    "heathens"
})
STRANGERS = v112("STRANGERS", {
    "kenya grace"
})
SUBWOOFER = v112("SUBWOOFER LULLABY", {
    "c418"
})
SUGAR_PLUM = v112("DANCE OF THE SUGAR PLUM FAIRY", {
    "christmas",
    "hard"
})
SUNFLOWER = v112("SUNFLOWER", {
    "spider man",
    "post malone"
})
SUPER_IDOL = v112("SUPER IDOL", {})
SUPER_MARIOS = v112("SUPER MARIO BROS", {})
SUZUME = v112(vu17("SUZUME"), {
    "radwimps"
})
SWEATER_WEATHER = v112("SWEATER WEATHER", {
    "the neighbourhood",
    "love",
    "popular"
})
SWEDEN = v112("SWEDEN", {
    "c418"
})
SWIMMING = v112("SWIMMING", {
    "flawed mangoes",
    "dramamime"
})
SYMPHONY_NO5 = v112("SYMPHONY NO.5", {
    "ludwig van beethoven",
    "5th symphony",
    "fifth symphony"
})
TAKE_FIVE = v112("TAKE FIVE", {
    "dave brubeck",
    "jazz"
})
TAKE_ON_ME = v112("TAKE ON ME", {
    "a-ha"
})
TEST_DRIVE = v112("TEST DRIVE", {
    "how to train your dragon",
    "john powell"
})
THATS_WHAT_I_WANT = v112("THATS WHAT I WANT", {
    "lil nas x"
})
AUTUMN = v112("THE 4 SEASONS - AUTUMN", {
    "the 4 seasons",
    "vivaldi",
    "the four seasons"
})
SPRING = v112("THE 4 SEASONS - SPRING", {
    "the 4 seasons",
    "vivaldi",
    "the four seasons"
})
SUMMER = v112("THE 4 SEASONS - SUMMER", {
    "the 4 seasons",
    "vivaldi",
    "the four seasons"
})
WINTER = v112("THE 4 SEASONS - WINTER", {
    "the 4 seasons",
    "vivaldi",
    "the four seasons"
})
THE_AMAZING_DIGITAL = v112("THE AMAZING DIGITAL CIRCUS", {
    "pomni"
})
THE_BEN = v112("THE BENONI", {})
THE_ECSTASY_OF_GOLD = v112("THE ECSTASY OF GOLD", {
    "the good, the bad and the ugly",
    "the good the bad and the ugly"
})
THE_ENTERTAINER = v112("THE ENTERTAINER", {})
THE_GREAT_FAIRY = v112("THE GREAT FAIRY FOUNTAIN", {
    "zelda",
    "the legend of zelda"
})
THE_LEGEND = v112("THE LEGEND", {
    "toby fox"
})
THE_NIGHTS = v112("THE NIGHTS", {
    "avicii"
})
THE_SEARCH = v112("THE SEARCH", {
    "nf"
})
THE_SLAUGHTER_CONT = v112("THE SLAUGHTER CONTINUES", {
    "undertale last breath",
    "last breath"
})
THE_WORLD = v112("THE WORLD", {
    "death note"
})
THE_WORLD_REVOLVING = v112("THE WORLD REVOLVING", {
    "toby fox"
})
THICK_OF_IT = v112("THICK OF IT", {
    "nigga",
    "ksi",
    "shit",
    "popular"
})
THIS_IS_WHAT_HEARTBREAK = v112("THIS IS WHAT HEARTBREAK FEELS LIKE", {
    "jvke",
    "golden hour"
})
THIS_IS_WHAT_WINTER = v112("THIS IS WHAT WINTER FEELS LIKE", {
    "jvke",
    "golden hour"
})
TICKING = v112("TICKING", {})
TIME_BACK = v112("TIME BACK", {})
TIME_FLOWS_EVER_ONWARD = v112(vu17("TIME FLOWS EVER ONWARD"), {
    "frieren",
    "sousou no frieren",
    "frieren: beyond journey\'s end",
    "frieren beyond journeys end"
})
TORRENT = v112("ETUDE OP.10 NO.4 (TORRENT)", {
    "frederic chopin"
})
TOXIC = v112("TOXIC (BOYWITHUKE)", {})
TRAP_R = v112("TRAP ROYALTY", {
    "fetty wap"
})
TURKISH = v112("TURKISH MARCH", {
    "mozart",
    "rondo alla turca"
})
UNDERSTAND = v112("UNDERSTAND", {
    "boywithuke"
})
UNDERTALE = v112("UNDERTALE", {})
UNDERWATER = v112("UNDERWATER PROM QUEENS", {
    "omori"
})
UNITY = v112("UNITY", {
    "thefatrat",
    "ncs",
    "no copyright sounds"
})
UNRAVEL = v112("UNRAVEL", {
    "tokyo ghoul"
})
UNRAVEL_EPIC = v112("UNRAVEL (ANIMENZ ARR.)", {
    "tokyo ghoul",
    "animenz",
    "unravel epic"
})
UNSTOPPABLE = v112("UNSTOPPABLE", {
    "sia"
})
UNTIL_I_FOUND_YOU = v112("UNTIL I FOUND YOU", {
    "stephen sanchez"
})
UNTITLED = v112("UNTITLED", {
    "oobja main theme",
    "cooked"
})
VAMPIRE = v112("VAMPIRE", {
    "olivia rodrigo"
})
VIVA_LA_VIDA = v112("VIVA LA VIDA", {
    "coldplay"
})
WAITING_FOR = v112("WAITING FOR LOVE", {
    "avicii"
})
WAKE_ME = v112("WAKE ME UP", {
    "avicii"
})
WALTZ_IN_C_MINOR = v112("CHOPIN - WALTZ OP.64 NO.2", {
    "frederic chopin"
})
WASHING = v112("WASHING MACHINE HEART", {
    "mitski"
})
WE_ARE = v112("ONE PIECE - WE ARE!", {})
WE_DONT = v112("WE DONT TALK ABOUT BRUNO", {
    "encanto"
})
WEDDING_MARCH = v112("WEDDING MARCH", {
    "wedding"
})
WET_HANDS = v112("WET HANDS", {
    "c418"
})
WHERE_WE = v112("WHERE WE PLAYED", {
    "omori"
})
WHY_DID_I_SAY = v112("WHY DID I SAY OKIE-DOKIE", {
    "doki doki literature club",
    "ddlc"
})
WII_SPORTS_TITLE = v112("WII SPORTS TITLE THEME", {
    "wii sports",
    "nintendo"
})
WINTER_WIND = v112("ETUDE OP.25 NO.11 (WINTER WIND)", {
    "frederic chopin"
})
WORLDS_END = v112("WORLDS END VALENTINE", {
    "omori"
})
XO_TOUR = v112("XO TOUR LLIF3", {
    "lil uzi vert"
})
YOUNG_GIRL_A = v112(vu17("YOUNG GIRL A"), {
    "siinamota",
    "vocaloid"
})
YOUNG_GIRL_A_2 = v112(vu17("YOUNG GIRL A") .. " - EPIC VER.", {
    "siinamota",
    "vocaloid"
})
YOUR_REALITY = v112("YOUR REALITY", {
    "ddlc",
    "doki"
})
YUUSHA = v112("YUUSHA/THE BRAVE (\229\139\135\232\128\133)", {
    "yoasobi",
    "frieren",
    "sousou no frieren",
    "frieren: beyond journey\'s end",
    "frieren beyond journeys end"
})
ZOMBIE = v112("ZOMBIE", {
    "the cranberries"
})
GIMME_GIMME_GIMME = v112("GIMME! GIMME! GIMME!", {
    "abba"
})
BARBIE_GIRL = v112("BARBIE GIRL", {})
WHAT_IS_LOVE = v112("WHAT IS LOVE", {
    "haddaway"
})
DRAGOSTEA_DIN_TEI = v112("DRAGOSTEA DIN TEI (NUMA NUMA)", {
    "o-zone",
    "o zone"
})
STAYIN_ALIVE = v112("STAYIN\' ALIVE", {
    "the bee gees",
    "the bee gess"
})
CLOSE_EYES = v112("CLOSE EYES", {
    "closed eyes",
    "dvrst",
    "phonk"
})
BOOM_BOOM_BOOM_BOOM = v112("BOOM BOOM BOOM BOOM", {
    "vengaboys"
})
FUNK_ESTRANHO = v112("FUNK ESTRANHO", {
    "ALXIKE",
    "phonk"
})
GUREN_NO_YUMIYA = v112(vu17("GUREN NO YUMIYA"), {
    "animenz",
    "attack on titan",
    "aot"
})
IDEA_1 = v112("IDEA 1", {
    "gibran alcocer"
})
COMEDY = v112(vu17("COMEDY"), {})
LET_IT_GO = v112("LET IT GO", {
    "elsa",
    "frozen",
    "disney"
})
BETTER_OFF_ALONE = v112("BETTER OFF ALONE", {
    "a deejay",
    "deejay"
})
MY_WAR = v112("MY WAR", {
    "boku no sensou",
    "attack on titan"
})
AFRICA = v112("AFRICA", {
    "toto"
})
KICK_BACK = v112("KICK BACK", {
    "chainsaw man"
})
REVENGE = v112("REVENGE (CREEPER)", {
    "creeper awww",
    "tryhardninja",
    "captainsparklez"
})
SPECIALZ = v112("SPECIALZ", {
    "jujutsu kaisen",
    "jjk"
})
F1 = v112("F1", {
    "hans zimmer"
})
MONTAGEM_CORAL = v112("MONTAGEM CORAL", {
    "phonk",
    "funk"
})
RUNNING_IN_THE_90S = v112("RUNNING IN THE 90S", {
    "max coveri"
})
A_CRUEL_ANGELS_THESIS = v112(vu17("A CRUEL ANGEL\'S THESIS"), {
    "neon genesis evangelion",
    "neo genesis",
    "a cruel angels"
})
BLUEBIRD = v112("BLUE BIRD", {
    "naruto shippuden"
})
IM_INVINCIBLE = v112(vu17("I\'M INVINCIBLE"), {
    "one piece film red",
    "im invincible"
})
LAMOUR_TOUJOURS = v112("L\'AMOUR TOUJOURS", {
    "gigi d\'agostino",
    "gigi dagostino"
})
CRAZY_FROG = v112("CRAZY FROG", {
    "axel f"
})
YOUR_GAZE = v112(vu17("YOUR GAZE, CREPUSCULAR"), {
    "the fragrant flower blooms with dignity",
    "Manazashi wa Hikari"
})
SHINZOU_WO_SASEGEYO = v112(vu17("SHINZOU WO SASEGEYO!"), {
    "attack on titan",
    "dedicate your heart"
})
A2_PHUT_HON = v112("2 PHUT HON FUNK", {
    "phonk",
    "salesman"
})
I_CANT_HANDLE_CHANGE = v112("I CANT HANDLE CHANGE", {
    "roar"
})
HANA_NI_NATTE = v112(vu17("HANA NI NATTE"), {
    "the apothecary diaries"
})
IDEA_9 = v112("IDEA 9", {
    "gibran alcocer"
})
IDEA_22 = v112("IDEA 22", {
    "gibran alcocer"
})
A90210 = v112("90210", {
    "travis scott"
})
I_BROKE_A_STRING = v112("I BROKE A STRING MAKING THIS PART", {})
THE_BEGINNING = v112("THE BEGINNING", {
    "flawed mangoes"
})
GYMNOPEDIE_NO1 = v112("GYMNOP\195\137DIE NO.1", {
    "satie"
})
CRY_FOR_ME_MICHITA = v112("CRY FOR ME (feat. \230\132\155\230\181\183)", {})
DARK_IS_THE_NIGHT = v112("DARK IS THE NIGHT", {
    "Nikita Bogoslovsky"
})
MY_WAY = v112("MY WAY", {
    "frank sinatra"
})
STILL_DRE = v112("STILL D.R.E.", {
    "snoop dogg"
})
THE_BLUE_DANUBE = v112("THE BLUE DANUBE", {
    "squid game"
})
NEVER_BE_ALONE = v112("NEVER BE ALONE", {
    "fnaf",
    "five nights at freddy\'s",
    "shadrow"
})
RUDER_BUSTER = v112("RUDER BUSTER", {
    "toby fox"
})
LOVER_IS_A_DAY = v112("LOVER IS A DAY", {
    "cuco"
})
DANDELIONS = v112("DANDELIONS", {})
MY_KIND_OF_WOMAN = v112("MY KIND OF WOMAN", {
    "mac demarco"
})
WHEN_I_MET_YOU = v112("WHEN I MET YOU", {
    "apo hiking society"
})
SADNESS_AND_SORROW = v112(vu17("SADNESS AND SORROW"), {
    "naruto shippuden"
})
THIS_IS_WHAT_FALLING_IN_LOVE = v112("THIS IS WHAT FALLING IN LOVE FEELS LIKE", {
    "jvke"
})
CHA_LA_HEAD_CHA_LA = v112("CHA-LA HEAD-CHA-LA", {
    "dragon ball z"
})
UWA_SO_TEMPERATE = v112("UWA!! SO TEMPERATE\226\153\171", {
    "toby fox"
})
WE_WERE_ANGELS = v112(vu17("WE WERE ANGELS"), {
    "dragon ball z"
})
WIEGE = v112("WIEGE", {
    "alien stage"
})
DEPARTURE = v112("DEPARTURE!", {
    "hunter x hunter"
})
RUE_DES_TROIS_FRERES = v112("RUE DES TROIS FRERES", {})
ITS_TV_TIME = v112("IT\'S TV TIME!", {
    "toby fox",
    "its tv time"
})
CONCERTO_OP30_NO3 = v112("RACHMANINOFF - CONCERTO OP.30 NO.3", {
    "rachmaninoff"
})
MORNING_MOOD = v112("PEER GYNT OP.46 NO.1 (MORNING MOOD)", {
    "grow a garden"
})
ETUDE_NO3_UN_SOSPIRO = v112("LISZT - ETUDE NO.3 (UN SOSPIRO)", {
    "franz liszt"
})
SERENADE = v112("SCHUBERT - SERENADE", {
    "franz liszt"
})
POLONAISE = v112("POLONAISE IN F SHARP MINOR OP.44", {
    "frederic chopin"
})
VIENNA = v112("VIENNA", {
    "billy joel"
})
ONE_SUMMERS_DAY = v112(vu17("ONE SUMMER\'S DAY"), {
    "spirited away",
    "studio ghibli",
    "joe hisaishi",
    "one summers day"
})
LE_MONDE = v112("LE MONDE", {})
JUDAS = v112("JUDAS", {
    "lady gaga"
})
GYMONPEDIE_NO2 = v112("GYMNOP\195\137DIE NO.2", {
    "satie"
})
LIKE_HIM_BEST = v112("LIKE HIM (BEST PART)", {
    "chromakopia",
    "tyler the creator"
})
WATERFALL = v112("WATERFALL", {
    "toby fox"
})
KISS_THE_RAIN = v112("KISS THE RAIN", {
    "yiruma"
})
KAMADO_TANJIRO_NO_UTA = v112(vu17("KAMADO TANJIRO NO UTA"), {
    "demon slayer"
})
ON_MY_WAY = v112("ON MY WAY", {
    "alan walker",
    "ncs",
    "no copyright sounds"
})
A7_YEARS = v112("7 YEARS", {
    "lukas graham"
})
PIANO_MAN = v112("PIANO MAN", {
    "billy joel"
})
NIGHT_DANCER = v112("NIGHT DANCER", {
    "imase"
})
LET_YOU_BREAK_MY_HEART_AGAIN = v112("LET YOU BREAK MY HEART AGAIN", {
    "laufey"
})
WHAT_WAS_I_MADE_FOR = v112("WHAT WAS I MADE FOR", {
    "billie eilish"
})
SPAWN = v112("SPAWN", {
    "toby fox"
})
ALL_I_WANT_FOR_CHRISTMAS_IS_YOU = v112("ALL I WANT FOR CHRISTMAS IS YOU", {
    "mariah carey"
})
IN_HELL_WE_LIVE = v112("IN HELL WE LIVE, LAMENT", {
    "mili",
    "limbus company"
})
SPOOKY_SCARY_SKELETONS = v112("SPOOKY SCARY SKELETONS", {
    "halloween"
})
A_HOME_FOR_FLOWERS = v112("A HOME FOR FLOWERS", {})
MONTAGEM_XONADA = v112("MONTAGEM XONADA", {
    "MXZI",
    "phonk",
    "funk"
})
BLACK_KNIFE = v112("BLACK KNIFE", {
    "toby fox"
})
RENAI_CIRCULATION = v112(vu17("RENAI CIRCULATION"), {
    "bakemonogatari"
})
CHIISANA_KOI_NO_UTA = v112(vu17("CHIISANA KOI NO UTA"), {})
WHERE_OUR_BLUE_IS = v112(vu17("WHERE OUR BLUE IS"), {
    "tatsuya kitani",
    "jjk",
    "jujutsu kaisen"
})
CHAMBER_OF_REFLECTION = v112("CHAMBER OF REFLECTION", {
    "mac demarco"
})
SWAN_LAKE = v112("SWAN LAKE", {
    "tchaikovsky"
})
BUTCHER_VANITY = v112("BUTCHER VANITY", {
    "vane lily",
    "forsaken",
    "roblox"
})
THIS_IS_HALLOWEEN = v112("THIS IS HALLOWEEN", {})
CANT_HELP_FALLING_IN_LOVE = v112("CAN\'T HELP FALLING IN LOVE", {
    "elvis presley",
    "cant help falling in love"
})
LIKE_HIM = v112("LIKE HIM", {
    "tyler the creator",
    "chromakopia"
})
CRUCIFIED = v112("CRUCIFIED", {
    "army of lovers"
})
BLACK_CATCHER = v112("BLACK CATCHER", {
    "black clover"
})
LOVELY = v112("LOVELY", {
    "billie eilish",
    "khalid"
})
HEY_KIDS = v112("HEY KIDS", {})
SNOWMAN = v112("SNOWMAN", {
    "christmas",
    "sia"
})
PIXEL_PEEKER_POLKA = v112("PIXEL PEEKER POLKA (DON\'T TOUCH MY PIZZA)", {
    "kevin macleod",
    "dont touch my pizza"
})
FAST = v112("FAST", {
    "juice wrld"
})
GYMNOPEDIE_NO3 = v112("GYMNOP\195\137DIE NO.3", {
    "satie"
})
REFLECTIONS = v112(vu17("REFLECTIONS"), {
    "toshifumi hinata"
})
LOVE_STORY = v112("LOVE STORY", {
    "indila"
})
HELLO_ADELE = v112("HELLO (ADELE)", {
    "adele"
})
LET_IT_GO_X_LET_HER_GO = v112("LET IT GO X LET HER GO", {
    "frozen"
})
I_WONDER = v112("I WONDER", {
    "kanye west",
    "graduation"
})
RANSOM = v112("RANSOM", {
    "lil tecca"
})
LET_HER_GO = v112("LET HER GO", {
    "passenger"
})
TIMELESS = v112("TIMELESS", {
    "the weeknd",
    "the weekend",
    "playboi carti"
})
JUST_THE_TWO_OF_US = v112("JUST THE TWO OF US", {
    "jazz"
})
TEK_IT = v112("TEK IT", {
    "cafune"
})
FLY_MY_WINGS = v112("FLY, MY WINGS", {
    "limbus company",
    "mili",
    "fly my wings"
})
AI_SCREAM = v112(vu17("AI\226\153\161SCREAM!"), {
    "aiscream",
    "ai scream"
})
HOLLOW_KNIGHT_MAIN_THEME = v112("HOLLOW KNIGHT MAIN THEME", {})
HIDE = v112("HIDE", {
    "dorian concept",
    "hide dorian concept"
})
LAST_GOODBYE = v112("LAST GOODBYE", {
    "toby fox"
})
DAD_BATTLE = v112("DAD BATTLE (FNF)", {
    "friday night funkin",
    "kawai sprite"
})
YOUR_POWER = v112("YOUR POWER", {
    "billie eilish"
})
WE_ARE_NUMBER_ON = v112("WE ARE NUMBER ONE", {})
NEW_HOME = v112("NEW HOME", {})
DIE_FOR_YOU = v112("DIE FOR YOU", {
    "the weeknd"
})
DIRTMOUTH = v112("DIRTMOUTH", {
    "hollow knight"
})
NERVES = v112("NERVES (FNF VS GARCELLO)", {
    "friday night funkin"
})
SWEET_DREAMS = v112("SWEET DREAMS", {
    "sweet dreams are made of this"
})
HERO = v112("HERO (LIMBUS COMPANY)", {
    "mili"
})
SILLY_BILLY = v112("SILLY BILLY (FNF)", {
    "friday night funkin"
})
VAN_GOGH = v112("VAN GOGH", {})
GONE_ANGELS = v112("GONE ANGELS", {
    "limbus company",
    "mili"
})
ONE_OF_THE_GIRLS = v112("ONE OF THE GIRLS", {
    "idol",
    "the weeknd"
})
ROI = v112("ROI (VIDEOCLUB)", {})
PASILYO = v112("PASILYO", {
    "sunkissed lola"
})
ROBBERY = v112("ROBBERY", {
    "juice wrld"
})
CHILDREN = v112("CHILDREN", {
    "robert miles"
})
CONGRATULATIONS = v112("CONGRATULATIONS", {
    "mac miller"
})
ITS_RAINING_SOMEWHERE_ELSE = v112("IT\'S RAINING SOMEWHERE ELSE", {
    "its raining somewhere else",
    "toby fox"
})
WE_NOT_LIKE_U = v112("WE NOT LIKE YOU", {
    "nettspend"
})
FLIGHT = v112("FLIGHT (MAN OF STEEL)", {
    "hans zimmer"
})
KEEP_UP = v112("KEEP UP (ODETARI)", {})
A_TALE_OF_SIX = v112(vu17("A TALE OF SIX TRILLION YEARS AND A NIGHT"), {
    "Rokuchonen to Ichiya Monogatari",
    "a tale of six trillion years and a night"
})
MULTO = v112("MULTO", {
    "ghost",
    "cup of joe"
})
YLANG_YLANG = v112("YLANG YLANG", {})
LAST_CHRISTMAS = v112("LAST CHRISTMAS", {
    "wham"
})
CREEPIN = v112("CREEPIN\'", {
    "metro boomin",
    "the weeknd",
    "21 savage"
})
FEEL_GOOD_INC = v112("FEEL GOOD INC", {
    "gorillaz"
})
ALL_STAR = v112("ALL STAR", {
    "shrek",
    "smash mouth"
})
SUPER_SMASH_BROS = v112("SUPER SMASH BROS. ULTIMATE", {
    "super smash bros"
})
NEVER_SEE_ME_AGAIN = v112("NEVER SEE ME AGAIN", {
    "kanye west"
})
BIRDLAND = v112("BIRDLAND", {
    "jazz"
})
AMOUR_PLASTIQUE = v112("AMOUR PLASTIQUE", {
    "napolean",
    "theres nothing we can do",
    "videoclub"
})
GEOMETRICAL_DOMINATOR = v112("GEOMETRICAL DOMINATOR", {
    "gd",
    "waterflame"
})
SLOW_DANCING_IN = v112("SLOW DANCING IN THE DARK", {
    "joji"
})
HOME = v112("HOME (UNDERTALE)", {
    "toby fox"
})
MRS_MAGIC = v112("MRS MAGIC", {
    "strawberry guy"
})
CALL_OUT_MY_NAME = v112("CALL OUT MY NAME", {
    "the weeknd"
})
GOLDEN_BROW = v112("GOLDEN BROWN", {
    "the stranglers"
})
THE_REAL_SLIM_SHADY = v112("THE REAL SLIM SHADY", {
    "eminem"
})
AROUND_THE_WORLD = v112("AROUND THE WORLD", {
    "atc",
    "la la la"
})
NEW_COMPUTERS = v112("ALL ROADS LEAD TO ROME", {
    "girlfriends",
    "new computers"
})
TIME = v112("TIME", {
    "hans zimmer",
    "inception"
})
THIS_IS_WHAT_SPACE = v112("THIS IS WHAT SPACE FEELS LIKE", {
    "jvke"
})
PROPOSE = v112(vu17("PROPOSE (9LANA)"), {
    "Naishi no Pierced Earrings",
    "propose",
    "9lana",
    "vocaloid"
})
BEAUTIFUL_IN_WHITE = v112("BEAUTIFUL IN WHITE", {
    "westlife"
})
KISS_OF_DEATH = v112("KISS OF DEATH", {
    "darling in the franxx",
    "darling and the franxx"
})
TRANSCEDENTAL_ETUDE_4 = v112("TRANSCEDENTAL ETUDE NO.4 (MAZEPPA)", {
    "franz liszt"
})
VOILA = v112("VOIL\195\128", {
    "voila"
})
JINGLE_BELLS = v112("JINGLE BELLS", {
    "holidays",
    "christmas",
    "one horse open sleigh"
})
SANTA_CLAUS_IS_COMING = v112("SANTA CLAUS IS COMING TO TOWN", {
    "christmas",
    "holidays"
})
SINKING_TOWN = v112(vu17("SINKING TOWN"), {
    "sinking town",
    "shizumeru machi"
})
JINGLE_BELL_ROCK = v112("JINGLE BELL ROCK", {
    "christmas",
    "holidays"
})
LIFE_WILL_CHANGE = v112("LIFE WILL CHANGE (PERSONA 5)", {
    "persona 5"
})
TREACHERY = v112("TREACHERY (BLEACH)", {})
MERRY_CHRISTMAS_MR_LAWRENCE = v112("MERRY CHRISTMAS, MR LAWRENCE", {
    "merry christmas mr lawrence",
    "holidays"
})
DECK_THE_HALLS = v112("DECK THE HALLS", {
    "holidays",
    "christmas"
})
THE_ABYSS = v112("THE ABYSS", {
    "the weeknd",
    "lana del ray"
})
IN_THE_POOL = v112("IN THE POOL (CHAINSAW MAN)", {
    "chainsaw man reze arc"
})
THANG_DIEN = v112("THANG DIEN", {
    "justatea",
    "justatee"
})
HERE_TO_STAY = v112("HERE TO STAY (BLEACH)", {})
ONCE_UPON_A_DECEMBER = v112("ONCE UPON A DECEMBER", {
    "anastasia",
    "holidays",
    "christmas"
})
LEAVE_THE_DOOR_OPEN = v112("LEAVE THE DOOR OPEN", {
    "bruno mars"
})
IRIS_OUT = v112("IRIS OUT (CHAINSAW MAN)", {
    "reze arc",
    "chainsaw man reze arc"
})
DIED_IN_YOUR_ARMS = v112("DIED IN YOUR ARMS", {
    "i just died in your arms tonight",
    "cutting crew",
    "die in your arms"
})
I_HATE_U_I_LOVE_U = v112("I HATE U, I LOVE U", {
    "gnash",
    "olivia obrien",
    "olivia o\'brien"
})
SAITAMAS_THEME = v112("SAITAMA\'S THEME", {
    "one punch man",
    "saitamas theme sad",
    "saitamas sad theme"
})
FLIGHT_OF_THE_BUMBLEBEE = v112("FLIGHT OF THE BUMBLEBEE", {})
WE_WISH_YOU_A_MERRY = v112("WE WISH YOU A MERRY CHRISTMAS", {
    "holidays",
    "christmas"
})
THIS_IS_HOME = v112("THIS IS HOME", {
    "cavetown"
})
THE_WINNER_TAKES_IT_ALL = v112("THE WINNER TAKES IT ALL", {
    "abba"
})
THROUGH_PATCHES_OF_VIOLET = v112("THROUGH PATCHES OF VIOLET", {
    "mili",
    "limbus company"
})
BINKS_RUM = v112("BINKS\' RUM", {
    "one piece",
    "binks rum",
    "binks sake"
})
local v114, v115, v116 = ipairs(vu42:GetChildren())
local vu117 = vu30
local vu118 = vu18
local vu119 = {}
while true do
    local v120, v121 = v114(v115, v116)
    if v120 == nil then
        break
    end
    v116 = v120
    if v121:IsA("TextButton") and (v121 ~= LOOPRANDOM and v121 ~= PLAYRANDOM) then
        table.insert(vu119, v121)
    end
end
table.sort(vu119, function(p122, p123)
    return p122.Name:lower() < p123.Name:lower()
end)
local v124, v125, v126 = ipairs(vu119)
while true do
    local v127
    v126, v127 = v124(v125, v126)
    if v126 == nil then
        break
    end
    v127.LayoutOrder = v126 + 3
end
MANGOMANGOMANGO = v112("MANGO MANGO MANGO", {})
MANGOMANGOMANGO.LayoutOrder = # vu119 + 1
DEATH_WALTZ = v112("DEATH WALTZ (WARNING)", {})
DEATH_WALTZ.LayoutOrder = # vu119 + 1
local vu128 = {{button=INTERSTELLAR,bpm="104",var=false,url="INTERSTELLAR",cat={"epic","beautiful","movies/tv"}},{button=RUSHE,bpm="80",var=false,url="RUSH_E",cat={"memes"}},{button=GOLDENHOUR,bpm="94",var=false,url="GOLDEN_HOUR",cat={"beautiful","best"}},{button=CUPID,bpm="120",var=false,url="CUPID",cat={"pop/hiphop"}},{button=RATDANCE,bpm="120",var=false,url="RAT_DANCE",cat={"memes"}},{button=RUNAWAY,bpm="160",var=false,url="RUNAWAY",cat={"pop/hiphop"}},{button=YOUR_REALITY,bpm="105",var=false,url="YOUR_REALITY",cat={"video games","beautiful","best"}},{button=ANOTHER_LOVE,bpm="123",var=false,url="ANOTHER_LOVE",cat={"sad","best","epic","beautiful","pop/hiphop"}},{button=FINAL_DUET,bpm="84",var=false,url="FINAL_DUET",cat={"video games","omori"}},{button=EXPERIENCE,bpm="92",var=false,url="EXPERIENCE",cat={"epic","best","beautiful","peak"}},{button=CAN_YOU_HEAR,bpm="75",var=false,url="CAN_YOU_HEAR",cat={"epic","movies/tv"}},{button=HOWLS_MOVING_CASTLE,bpm="156",var=false,url="HOWLS_MOVING_CASTLE",cat={"anime/jpop","beautiful","movies/tv"}},{button=YOUNG_GIRL_A,bpm="130",var=false,url="YOUNG_GIRL_A",cat={"anime/jpop","sad","beautiful","best"}},{button=ARIA_MATH,bpm="84",var=false,url="ARIA_MATH",cat={"video games","minecraft","beautiful"}},{button=ALL_MY_FELLAS,bpm="160",var=false,url="ALL_MY_FELLAS",cat={"memes"}},{button=THICK_OF_IT,bpm="146",var=false,url="THICK_OF_IT",cat={"memes"}},{button=ROMANTIC_HOMICIDE,bpm="132",var=false,url="ROMANTIC_HOMICIDE",cat={"sad"}},{button=IF_I_AM_WITH_YOU,bpm="82",var=false,url="IF_I_AM_WITH_YOU",cat={"anime/jpop","best","beautiful","peak","movies/tv"}},{button=CRADLES,bpm="158",var=false,url="CRADLES",cat={"electronic"}},{button=IDOL,bpm="166",var=false,url="IDOL",cat={"anime/jpop","best","movies/tv"}},{button=RIVER_FLOWS,bpm="137",var=false,url="RIVER_FLOWS_IN_YOU",cat={"sad"}},{button=NOCTURNE,bpm="62",var=false,url="NOCTURNE",cat={"classical","best"}},{button=ISABELLA,bpm="112",var=false,url="ISABELLAS_LULLABY",cat={"video games"}},{button=GIORNO,bpm="135",var=false,url="GIORNO",cat={"anime/jpop","memes","movies/tv"}},{button=GIVE_UP,bpm="113",var=false,url="GIVE_UP",cat={"memes","pop/hiphop"}},{button=UNRAVEL,bpm="135",var=false,url="UNRAVEL",cat={"anime/jpop","beautiful","movies/tv"}},{button=WINTER_WIND,bpm="125",var=false,url="WINTER_WIND",cat={"classical"}},{button=SWEATER_WEATHER,bpm="124",var=false,url="SWEATER_WEATHER",cat={"sad"}},{button=VIVA_LA_VIDA,bpm="138",var=false,url="VIVA_LA_VIDA",cat={"epic","beautiful","best","peak"}},{button=M3,bpm="163",var=false,url="WHAT_THE_FUCKK",cat={"classical","best","peak"}},{button=NEVER_MEANT,bpm="66",var=false,url="NEVER_MEANT",cat={"anime/jpop","movies/tv"}},{button=AVENGERS,bpm="120",var=false,url="AVENGERS",cat={"epic","best","movies/tv"}},{button=BEETHOVEN_VIRUS,bpm="162",var=false,url="BEETHOVEN_VIRUS",cat={"classical","electronic","best","peak"}},{button=LA_CAMPANELLA,bpm="107",var=false,url="LA_CAMPANELLA",cat={"classical","best","peak","beautiful"}},{button=KEROSENE,bpm="116",var=false,url="KEROSENE",cat={"electronic"}},{button=RACING_INTO,bpm="129",var=false,url="RACING_INTO",cat={"anime/jpop","best","beautiful"}},{button=SURVIVE,bpm="80",var=false,url="SURVIVE",cat={"pop/hiphop","best"}},{button=MEGALOVANIA,bpm="120",var=false,url="MEGALOVANIA",cat={"video games","undertale","memes"}},{button=COCONUT,bpm="132",var=false,url="COCONUT",cat={"video games"}},{button=FADED,bpm="90",var=false,url="FADED",cat={"electronic","sad"}},{button=SOLAS,bpm="120",var=false,url="SOLAS",cat={"beautiful"}},{button=MARRIED,bpm="83",var=false,url="MARRIED",cat={"sad","movies/tv"}},{button=BAD_PIGGIES,bpm="156",var=false,url="BAD_PIGGIES",cat={"video games"}},{button=ASGORE,bpm="115",var=false,url="ASGORE",cat={"video games","undertale"}},{button=CARELESS,bpm="153",var=false,url="CARELESS",cat={"memes"}},{button=I_WANT,bpm="122",var=false,url="I_WANT",cat={"pop/hiphop","rock"}},{button=IM_STILL,bpm="177",var=false,url="IM_STILL",cat={"best","rock","movies/tv"}},{button=HELLO,bpm="105",var=false,url="HELLO",cat={"electronic"}},{button=BAD_APPLE,bpm="138",var=false,url="BAD_APPLE",cat={"anime/jpop"}},{button=FR,bpm="82",var=false,url="FR",cat={"beautiful"}},{button=DIE_WITH,bpm="76",var=false,url="DIE_WITH",cat={"pop/hiphop","sad","beautiful","best","peak"}},{button=FALLEN_DOWN,bpm="110",var=false,url="FALLEN_DOWN",cat={"video games","undertale","beautiful"}},{button=ENIGMATIC,bpm="50",var=false,url="ENIGMATIC",cat={"video games","undertale","best","peak"}},{button=DEATH_WALTZ,bpm="210",var=false,url="DEATH_WALTZ",cat={"all"}},{button=MIKU,bpm="135",var=false,url="MIKU",cat={"anime/jpop"}},{button=A_THOUSAND,bpm="100",var=false,url="A_THOUSAND",cat={"pop/hiphop"}},{button=SUGAR_PLUM,bpm="70",var=false,url="SUGAR_PLUM",cat={"classical","seasonal"}},{button=SPEED_OF,bpm="162",var=false,url="SPEED_OF",cat={"video games","electronic","epic","best","peak","geometry dash"}},{button=WET_HANDS,bpm="74",var=false,url="WET_HANDS",cat={"video games","minecraft","beautiful"}},{button=SWEDEN,bpm="44",var=false,url="SWEDEN",cat={"video games","minecraft"}},{button=SUBWOOFER,bpm="76",var=false,url="SUBWOOFER",cat={"video games","minecraft"}},{button=MICE_ON,bpm="56",var=false,url="MICE_ON",cat={"video games","minecraft","sad"}},{button=DRY_HANDS,bpm="90",var=false,url="DRY_HANDS",cat={"video games","minecraft","beautiful"}},{button=HAGGSTORM,bpm="102",var=false,url="HAGGSTORM",cat={"video games","minecraft"}},{button=LIVING_MICE,bpm="74",var=false,url="LIVING_MICE",cat={"video games","minecraft"}},{button=KEY,bpm="70",var=false,url="KEY",cat={"video games","minecraft","beautiful"}},{button=MOOG_CITY,bpm="116",var=false,url="MOOG_CITY",cat={"video games","minecraft","beautiful","best"}},{button=MINECRAFT,bpm="106",var=false,url="MINECRAFT",cat={"video games","minecraft"}},{button=UNDERTALE,bpm="100",var=false,url="UNDERTALE",cat={"video games","undertale","best","epic"}},{button=HOPES_DREAMS,bpm="170",var=false,url="HOPES_DREAMS",cat={"video games","undertale","best","epic","peak"}},{button=NYEH,bpm="150",var=false,url="NYEH",cat={"video games","undertale","best"}},{button=SPIDER_DANCE,bpm="115",var=false,url="SPIDER_DANCE",cat={"video games","undertale"}},{button=HEARTACHE,bpm="160",var=false,url="HEARTACHE",cat={"video games","undertale"}},{button=BATTLE_AGAINST,bpm="150",var=false,url="BATTLE_AGAINST",cat={"video games","undertale"}},{button=HIS_THEME,bpm="90",var=false,url="HIS_THEME",cat={"video games","undertale"}},{button=SNOWY,bpm="120",var=false,url="SNOWY",cat={"video games","undertale"}},{button=SPEAR_OF,bpm="130",var=false,url="SPEAR_OF",cat={"video games","undertale","best"}},{button=DOG_SONG,bpm="230",var=false,url="DOG_SONG",cat={"video games","undertale"}},{button=ONCE_UPON,bpm="65",var=false,url="ONCE_UPON",cat={"video games","undertale"}},{button=NOT_A_SLACKER,bpm="145",var=false,url="NOT_A_SLACKER",cat={"video games","undertale"}},{button=SHOP,bpm="77",var=false,url="SHOP",cat={"video games","undertale"}},{button=FINALE,bpm="190",var=false,url="FINALE",cat={"video games","undertale"}},{button=BY_YOUR_SIDE,bpm="88",var=false,url="BY_YOUR_SIDE",cat={"video games","omori"}},{button=WORLDS_END,bpm="152",var=false,url="WORLDS_END",cat={"video games","omori","best"}},{button=LOST_LIBRARY,bpm="62",var=false,url="LOST_LIBRARY",cat={"video games","omori"}},{button=BREADY,bpm="160",var=false,url="BREADY",cat={"video games","omori","best"}},{button=IT_MEANS,bpm="96",var=false,url="IT_MEANS",cat={"video games","omori"}},{button=UNDERWATER,bpm="160",var=false,url="UNDERWATER",cat={"video games","omori"}},{button=WHERE_WE,bpm="96",var=false,url="WHERE_WE",cat={"video games","omori"}},{button=MARI_BOSS,bpm="169",var=false,url="MARI_BOSS",cat={"video games","omori"}},{button=GOOD_MORNING,bpm="90",var=false,url="GOOD_MORNING",cat={"video games","omori"}},{button=FUR_ELISE,bpm="72",var=false,url="FUR_ELISE",cat={"classical"}},{button=MOONLIGHT,bpm="51",var=false,url="MOONLIGHT",cat={"classical"}},{button=FANTAISIE,bpm="168",var=false,url="FANTAISIE",cat={"classical"}},{button=DROWNING_LOVE,bpm="112",var=false,url="DROWNING_LOVE",cat={"beautiful","sad","best","peak","movies/tv"}},{button=CANON_D,bpm="100",var=false,url="CANON_D",cat={"classical"}},{button=FREEDOM_DIVE,bpm="220",var=false,url="FREEDOM_DIVE",cat={"electronic"}},{button=STAY,bpm="85",var=false,url="STAY",cat={"pop/hiphop"}},{button=TURKISH,bpm="92",var=false,url="TURKISH",cat={"classical"}},{button=SUPER_MARIOS,bpm="180",var=false,url="SUPER_MARIOS",cat={"video games","memes"}},{button=MII,bpm="114",var=false,url="MII",cat={"video games","memes"}},{button=LACRIMOSA,bpm="64",var=false,url="LACRIMOSA",cat={"classical","memes"}},{button=DESPACITO,bpm="89",var=false,url="DESPACITO",cat={"pop/hiphop","memes"}},{button=WE_DONT,bpm="103",var=false,url="WE_DONT",cat={}},{button=HUNGARIAN,bpm="130",var=false,url="HUNGARIAN",cat={"classical"}},{button=SKYFALL,bpm="70",var=false,url="SKYFALL",cat={"epic","best"}},{button=THE_ENTERTAINER,bpm="60",var=false,url="THE_ENTERTAINER",cat={"memes","best"}},{button=DONT_STOP,bpm="118",var=false,url="DONT_STOP",cat={"rock","best"}},{button=DREAM_ON,bpm="78",var=false,url="DREAM_ON",cat={"rock"}},{button=HIT_THE_ROAD,bpm="60",var=false,url="HIT_THE_ROAD",cat={"rock"}},{button=TOXIC,bpm="180",var=false,url="TOXIC",cat={"sad","pop/hiphop"}},{button=UNDERSTAND,bpm="206",var=false,url="UNDERSTAND",cat={"sad"}},{button=SICK_OF_U,bpm="185",var=false,url="SICK_OF_U",cat={"sad"}},{button=IDGAF,bpm="196",var=false,url="IDGAF",cat={"sad"}},{button=EASY_ON_ME,bpm="73",var=false,url="EASY_ON_ME",cat={"","pop/hiphop"}},{button=METAMORPH,bpm="180",var=false,url="METAMORPH",cat={"electronic"}},{button=SWIMMING,bpm="165",var=false,url="SWIMMING",cat={"beautiful","best"}},{button=DRAMAM,bpm="224",var=false,url="DRAMAM",cat={"beautiful"}},{button=LOST_UMB,bpm="133",var=false,url="LOST_UMB",cat={"electronic","anime/jpop"}},{button=LOVELY_B,bpm="150",var=false,url="LOVELY_B",cat={"memes","best"}},{button=TRAP_R,bpm="151",var=false,url="TRAP_R",cat={"memes","epic","best","beautiful"}},{button=MANGOMANGOMANGO,bpm="110",var=false,url="MANGOMANGOMANGO",cat={"peak"}},{button=DREAM_FL,bpm="150",var=false,url="DREAM_FL",cat={"electronic"}},{button=LALALA,bpm="130",var=false,url="LALALA",cat={"pop/hiphop"}},{button=THE_BEN,bpm="180",var=false,url="THE_BEN",cat={"classical","epic","best"}},{button=POKEMON,bpm="160",var=false,url="POKEMON",cat={"video games","anime/jpop","movies/tv"}},{button=POKEMON_RED,bpm="180",var=false,url="POKEMON_RED",cat={"video games","anime/jpop","movies/tv"}},{button=FLASHING,bpm="100",var=false,url="FLASHING",cat={"pop/hiphop","epic","beautiful"}},{button=ALL_GIRLS,bpm="85",var=false,url="ALL_GIRLS",cat={"pop/hiphop","sad","best"}},{button=SAVE_YOUR,bpm="120",var=false,url="SAVE_YOUR",cat={"pop/hiphop","sad"}},{button=LIGHTS,bpm="132",var=false,url="LIGHTS",cat={"anime/jpop"}},{button=THE_WORLD,bpm="96",var=false,url="THE_WORLD",cat={"anime/jpop","rock","movies/tv"}},{button=L,bpm="71",var=false,url="L",cat={"anime/jpop","memes","movies/tv"}},{button=BLOODY,bpm="100",var=false,url="BLOODY",cat={"pop/hiphop","epic","best"}},{button=SPACE_SONG,bpm="75",var=false,url="SPACE_SONG",cat={"sad","pop/hiphop","beautiful","epic","best"}},{button=HEATHENS,bpm="90",var=false,url="HEATHENS",cat={"sad"}},{button=VAMPIRE,bpm="135",var=false,url="VAMPIRE",cat={"pop/hiphop","sad","best"}},{button=MARY_ON,bpm="130",var=false,url="MARY_ON",cat={"rock"}},{button=RUNNING_UP,bpm="108",var=false,url="RUNNING_UP",cat={"sad","pop/hiphop","movies/tv"}},{button=DUMB_DUMB,bpm="118",var=false,url="DUMB_DUMB",cat={"memes"}},{button=MA_MEILLEUR,bpm="178",var=false,url="MA_MEILLEUR",cat={"movies/tv"}},{button=SUZUME,bpm="78",var=false,url="SUZUME",cat={"anime/jpop","best","beautiful","movies/tv"}},{button=CHRISTMAS_KIDS,bpm="152",var=false,url="CHRISTMAS_KIDS",cat={"sad"}},{button=DARK_BEACH,bpm="130",var=false,url="DARK_BEACH",cat={"sad","beautiful"}},{button=FUKASHIGI,bpm="90",var=false,url="FUKASHIGI",cat={"anime/jpop","movies/tv"}},{button=SPARKLE,bpm="192",var=false,url="SPARKLE",cat={"anime/jpop","best","beautiful","movies/tv"}},{button=SHIKAIRO,bpm="182",var=false,url="SHIKAIRO",cat={"anime/jpop","memes","best","movies/tv"}},{button=WASHING,bpm="114",var=false,url="WASHING",cat={"sad","beautiful","best"}},{button=CAN_YOU_HEAR_EPIC,bpm="102",var=false,url="CAN_YOU_HEAR_EPIC",cat={"epic","best","peak","movies/tv"}},{button=UNRAVEL_EPIC,bpm="132",var=false,url="UNRAVEL_EPIC",cat={"epic","best","beautiful","peak","movies/tv"}},{button=A_SKY_FULL,bpm="120",var=false,url="A_SKY_FULL",cat={"epic","pop/hiphop","electronic"}},{button=THE_NIGHTS,bpm="128",var=false,url="THE_NIGHTS",cat={"pop/hiphop","electronic","epic"}},{button=BIRDS_OF_A,bpm="105",var=false,url="BIRDS_OF_A",cat={"pop/hiphop","beautiful"}},{button=CANT_LET,bpm="160",var=false,url="CANT_LET",cat={"video games","electronic","geometry dash"}},{button=DEADLOCKED,bpm="140",var=false,url="DEADLOCKED",cat={"video games","electronic","geometry dash"}},{button=DUVET,bpm="91",var=false,url="DUVET",cat={"sad","beautiful","best"}},{button=FIVE_NIGHTS_1,bpm="108",var=false,url="FIVE_NIGHTS_1",cat={"video games","electronic","epic"}},{button=ITS_BEEN_SO,bpm="96",var=false,url="ITS_BEEN_SO",cat={"video games","electronic"}},{button=STEREO_MADNESS,bpm="160",var=false,url="STEREO_MADNESS",cat={"video games","electronic","geometry dash"}},{button=SUNFLOWER,bpm="90",var=false,url="SUNFLOWER",cat={"pop/hiphop","beautiful","best","movies/tv"}},{button=WAITING_FOR,bpm="129",var=false,url="WAITING_FOR",cat={"pop/hiphop","electronic","best","epic"}},{button=WAKE_ME,bpm="110",var=false,url="WAKE_ME",cat={"pop/hiphop","electronic"}},{button=GEOMETRY_DASH,bpm="128",var=false,url="GEOMETRY_DASH",cat={"video games","electronic","geometry dash"}},{button=ARUARIAN,bpm="80",var=false,url="ARUARIAN",cat={"beautiful"}},{button=DAYLIGHT,bpm="130",var=false,url="DAYLIGHT",cat={"beautiful","epic","best"}},{button=SHIAWASE,bpm="150",var=false,url="SHIAWASE",cat={"electronic","epic","beautiful","best","geometry dash"}},{button=EVERGREEN,bpm="120",var=false,url="EVERGREEN",cat={"beautiful","best"}},{button=FREAKS,bpm="175",var=false,url="FREAKS",cat={"sad","rock","beautiful"}},{button=HERE_WITH,bpm="132",var=false,url="HERE_WITH",cat={"sad"}},{button=RESONANCE,bpm="70",var=false,url="RESONANCE",cat={"beautiful","best"}},{button=INSANE,bpm="105",var=false,url="INSANE",cat={"electronic"}},{button=LEVELS,bpm="122",var=false,url="LEVELS",cat={"electronic","levels","best"}},{button=MOOD,bpm="91",var=false,url="MOOD",cat={"pop/hiphop","best"}},{button=SOMETHING_JUST,bpm="103",var=false,url="SOMETHING_JUST",cat={"pop/hiphop","sad","best","beautiful"}},{button=STRANGERS,bpm="170",var=false,url="STRANGERS",cat={"pop/hiphop","sad","best","beautiful"}},{button=TICKING,bpm="77",var=false,url="TICKING",cat={"epic","best","beautiful"}},{button=AFTER_DARK,bpm="140",var=false,url="AFTER_DARK",cat={"sad","beautiful"}},{button=ANYONE_CAN,bpm="100",var=false,url="ANYONE_CAN",cat={"sad"}},{button=BLUE,bpm="130",var=false,url="BLUE",cat={"pop/hiphop"}},{button=CLOUD_9,bpm="128",var=false,url="CLOUD_9",cat={"electronic"}},{button=DAMNED,bpm="95",var=false,url="DAMNED",cat={"video games"}},{button=ASTRONAMIA,bpm="120",var=false,url="ASTRONAMIA",cat={"memes","electronic"}},{button=COUNTING_STARS,bpm="105",var=false,url="COUNTING_STARS",cat={"pop/hiphop","sad"}},{button=SHAPE_OF,bpm="190",var=false,url="SHAPE_OF",cat={"pop/hiphop"}},{button=ENEMY,bpm="77",var=false,url="ENEMY",cat={"pop/hiphop"}},{button=FLARE,bpm="150",var=false,url="FLARE",cat={"electronic"}},{button=THIS_IS_WHAT_WINTER,bpm="115",var=false,url="THIS_IS_WHAT_WINTER",cat={"beautiful","pop/hiphop","best"}},{button=HEAT_WAVE,bpm="81",var=false,url="HEAT_WAVE",cat={"pop/hiphop"}},{button=HIGH_HOPES,bpm="164",var=false,url="HIGH_HOPES",cat={"pop/hiphop","epic"}},{button=HOUSE_OF,bpm="112",var=false,url="HOUSE_OF",cat={"pop/hiphop"}},{button=IN_THE_NAME,bpm="134",var=false,url="IN_THE_NAME",cat={"pop/hiphop","electronic","best","epic","beautiful"}},{button=PAST_LIVES,bpm="110",var=false,url="PAST_LIVES",cat={"sad","beautiful"}},{button=SLAY,bpm="120",var=false,url="SLAY",cat={"electronic"}},{button=SNOWFALL,bpm="96",var=false,url="SNOWFALL",cat={"beautiful","sad","best"}},{button=RISE_UP,bpm="82",var=false,url="RISE_UP",cat={"electronic","epic"}},{button=UNITY,bpm="110",var=false,url="UNITY",cat={"electronic","best"}},{button=MONODY,bpm="107",var=false,url="MONODY",cat={"electronic","epic","best"}},{button=THIS_IS_WHAT_HEARTBREAK,bpm="50",var=false,url="THIS_IS_WHAT_HEARTBREAK",cat={"sad","pop/hiphop"}},{button=CANDYLAND,bpm="130",var=false,url="CANDYLAND",cat={"electronic","best","best"}},{button=AS_IT_WAS,bpm="174",var=false,url="AS_IT_WAS",cat={"pop/hiphop","best"}},{button=CENTIMETER,bpm="140",var=false,url="CENTIMETER",cat={"anime/jpop","movies/tv"}},{button=DETROIT,bpm="60",var=false,url="DETROIT",cat={"video games","beautiful"}},{button=THE_GREAT_FAIRY,bpm="80",var=false,url="THE_GREAT_FAIRY",cat={"video games"}},{button=IMMORTAL,bpm="60",var=false,url="IMMORTAL",cat={"pop/hiphop"}},{button=XO_TOUR,bpm="142",var=false,url="XO_TOUR",cat={"pop/hiphop","sad"}},{button=THE_ECSTASY_OF_GOLD,bpm="85",var=false,url="THE_ECSTASY_OF_GOLD",cat={"movies/tv","epic","beautiful"}},{button=BLUE_YUNG,bpm="92",var=false,url="BLUE_YUNG",cat={"beautiful","best"}},{button=HES_A_PIRATE,bpm="207",var=false,url="HES_A_PIRATE",cat={"epic","best","movies/tv"}},{button=ITS_RAINING,bpm="120",var=false,url="ITS_RAINING",cat={"memes"}},{button=LET_ME_LOVE,bpm="100",var=false,url="LET_ME_LOVE",cat={"pop/hiphop","best","beautiful"}},{button=HAPPIER,bpm="100",var=false,url="HAPPIER",cat={"pop/hiphop","sad","beautiful","best"}},{button=SANS,bpm="120",var=false,url="SANS",cat={"video games","undertale","memes"}},{button=THE_SLAUGHTER_CONT,bpm="150",var=false,url="THE_SLAUGHTER_CONT",cat={"video games","undertale"}},{button=SONG_THAT_MIGHT,bpm="120",var=false,url="SONG_THAT_MIGHT",cat={"video games","undertale"}},{button=ASSUMPTIONS,bpm="126",var=false,url="ASSUMPTIONS",cat={"pop/hiphop","memes","electronic"}},{button=DEATH_BED,bpm="120",var=false,url="DEATH_BED",cat={"pop/hiphop","sad","beautiful"}},{button=DAWN_OF,bpm="72",var=false,url="DAWN_OF",cat={"video games"}},{button=ELEVATOR_JAM,bpm="146",var=false,url="ELEVATOR_JAM",cat={"video games"}},{button=ELEVATOR_JAM_2,bpm="146",var=false,url="ELEVATOR_JAM_2",cat={"video games","epic","best"}},{button=HERE_I_COME,bpm="144",var=false,url="HERE_I_COME",cat={"video games"}},{button=MONTAGEM_TOMADA,bpm="120",var=false,url="MONTAGEM_TOMADA",cat={"electronic"}},{button=NOTION,bpm="160",var=false,url="NOTION",cat={"rock","sad"}},{button=RISES_THE,bpm="127",var=false,url="RISES_THE",cat={"sad","beautiful"}},{button=HIMITSU_KOI_GOKORO,bpm="165",var=false,url="HIMITSU_KOI_GOKORO",cat={"anime/jpop","movies/tv"}},{button=LENAI,bpm="131",var=false,url="LENAI",cat={"anime/jpop","movies/tv"}},{button=IDOL_EPIC,bpm="166",var=false,url="IDOL_EPIC",cat={"anime/jpop","epic","best","movies/tv"}},{button=ALL_THE_STARS,bpm="120",var=false,url="ALL_THE_STARS",cat={"pop/hiphop","beautiful","best","movies/tv"}},{button=HOPE,bpm="146",var=false,url="HOPE",cat={"pop/hiphop","sad","beautiful","best"}},{button=ENTRY_OF_THE,bpm="220",var=false,url="ENTRY_OF_THE",cat={"classical","memes"}},{button=LUTHER,bpm="128",var=false,url="LUTHER",cat={"pop/hiphop"}},{button=HOWLS_MOVING_CASTLE_2,bpm="130",var=false,url="HOWLS_MOVING_CASTLE_2",cat={"anime/jpop","beautiful","best","epic","peak","movies/tv"}},{button=MAGICAL_CURE,bpm="120",var=false,url="MAGICAL_CURE",cat={"anime/jpop"}},{button=NOT_LIKE_US,bpm="101",var=false,url="NOT_LIKE_US",cat={"pop/hiphop","memes"}},{button=PEACHES,bpm="92",var=false,url="PEACHES",cat={"video games","movies/tv"}},{button=PRAYER,bpm="147",var=false,url="PRAYER",cat={"beautiful","pop/hiphop"}},{button=SEE_YOU_AGAIN,bpm="70",var=false,url="SEE_YOU_AGAIN",cat={"pop/hiphop","sad","beautiful"}},{button=GANGSTAS_PARADISE,bpm="80",var=false,url="GANGSTAS_PARADISE",cat={"pop/hiphop","memes","beautiful","best","epic","peak"}},{button=ERIKA,bpm="120",var=false,url="ERIKA",cat={"memes"}},{button=ITS_JUST_A_BURNING,bpm="74",var=false,url="ITS_JUST_A_BURNING",cat={"creepy/weirdcore","memes","sad"}},{button=ALL_I_WANT_IS_YOU,bpm="143",var=false,url="ALL_I_WANT_IS_YOU",cat={"pop/hiphop","sad","best","electronic"}},{button=SOVIET_UNION_ANTHEM,bpm="80",var=false,url="SOVIET_UNION_ANTHEM",cat={"memes"}},{button=UNTITLED,bpm="25",var=false,url="UNTITLED",cat={"video games","memes","sad","creepy/weirdcore"}},{button=WEDDING_MARCH,bpm="115",var=false,url="WEDDING_MARCH",cat={"memes","beautiful","classical"}},{button=WHY_DID_I_SAY,bpm="113",var=false,url="WHY_DID_I_SAY",cat={}},{button=WII_SPORTS_TITLE,bpm="115",var=false,url="WII_SPORTS_TITLE",cat={"video games","memes","epic"}},{button=YOUNG_GIRL_A_2,bpm="130",var=false,url="YOUNG_GIRL_A_2",cat={"anime/jpop","sad","epic","best","beautiful","peak"}},{button=BLINDING_LIGHTS,bpm="171",var=false,url="BLINDING_LIGHTS",cat={"pop/hiphop","best"}},{button=GOOFY_AHH,bpm="120",var=false,url="GOOFY_AHH",cat={"memes","epic","best","beautiful","peak"}},{button=GRAVITY_FALLS,bpm="120",var=false,url="GRAVITY_FALLS",cat={"memes","best","movies/tv"}},{button=GYPSY_WOMAN,bpm="120",var=false,url="GYPSY_WOMAN",cat={"memes","pop/hiphop"}},{button=I_LIKE_THE_WAY_YOU,bpm="151",var=false,url="I_LIKE_THE_WAY_YOU",cat={"pop/hiphop","sad","best","beautiful"}},{button=ISOLATION,bpm="100",var=false,url="ISOLATION",cat={"best","epic","video games","peak","geometry dash"}},{button=KAWAIKUTEGOMEN,bpm="160",var=false,url="KAWAIKUTEGOMEN",cat={"anime/jpop","best"}},{button=LIGHT_SWITCH,bpm="184",var=false,url="LIGHT_SWITCH",cat={"pop/hiphop"}},{button=SPECTRE,bpm="128",var=false,url="SPECTRE",cat={"electronic","memes","beautiful","best"}},{button=SUPER_IDOL,bpm="136",var=false,url="SUPER_IDOL",cat={"memes"}},{button=THATS_WHAT_I_WANT,bpm="85",var=false,url="THATS_WHAT_I_WANT",cat={"pop/hiphop"}},{button=THE_AMAZING_DIGITAL,bpm="110",var=false,url="THE_AMAZING_DIGITAL",cat={"best","movies/tv"}},{button=JOCELYN_FLORES,bpm="136",var=false,url="JOCELYN_FLORES",cat={"sad","beautiful"}},{button=FLY_ME_TO_THE_MOON,bpm="140",var=false,url="FLY_ME_TO_THE_MOON",cat={"classical","beautiful"}},{button=BAD_HABIT,bpm="80",var=false,url="BAD_HABIT",cat={"pop/hiphop","sad"}},{button=SOMEBODY_THAT_I_USED,bpm="120",var=false,url="SOMEBODY_THAT_I_USED",cat={"pop/hiphop","sad"}},{button=LEVAN_POLKKA,bpm="135",var=false,url="LEVAN_POLKKA",cat={"memes"}},{button=MY_ORDINARY_LIFE,bpm="130",var=false,url="MY_ORDINARY_LIFE",cat={"electronic"}},{button=RUINS,bpm="138",var=false,url="RUINS",cat={"video games","undertale"}},{button=STEREO_HEARTS,bpm="96",var=false,url="STEREO_HEARTS",cat={"pop/hiphop","best"}},{button=STRANGER_THINGS,bpm="80",var=false,url="STRANGER_THINGS",cat={"movies/tv"}},{button=HH,bpm="150",var=false,url="HH",cat={"memes","peak"}},{button=A505,bpm="140",var=false,url="505",cat={"rock","sad"}},{button=BELIEVER,bpm="188",var=false,url="BELIEVER",cat={"rock","pop/hiphop","epic"}},{button=CLUBSTEP,bpm="128",var=false,url="CLUBSTEP",cat={"video games","electronic","geometry dash"}},{button=EXPERIENCE_FLOWS,bpm="85",var=false,url="EXPERIENCE_FLOWS",cat={"beautiful","best"}},{button=FIELD_OF_MEMORIES,bpm="130",var=false,url="FIELD_OF_MEMORIES",cat={"video games","electronic","epic"}},{button=SKELETAL_SHENANIGANS,bpm="158",var=false,url="SKELETAL_SHENANIGANS",cat={"video games","electronic","geometry dash"}},{button=GODS_PLAN,bpm="130",var=false,url="GODS_PLAN",cat={"pop/hiphop"}},{button=HOTLINE_BLING,bpm="100",var=false,url="HOTLINE_BLING",cat={"pop/hiphop"}},{button=I_REALLY_WANT_TO_STAY,bpm="128",var=false,url="I_REALLY_WANT_TO_STAY",cat={"movies/tv","pop/hiphop","beautiful","electronic"}},{button=ICARUS,bpm="100",var=false,url="ICARUS",cat={"beautiful"}},{button=LAVENDER_TOWN,bpm="120",var=false,url="LAVENDER_TOWN",cat={"video games","memes","creepy/weirdcore"}},{button=ALONE,bpm="142",var=false,url="ALONE",cat={"electronic"}},{button=FRIENDS,bpm="95",var=false,url="FRIENDS",cat={"pop/hiphop","electronic"}},{button=MIDDLE_OF_THE_NIGHT,bpm="93",var=false,url="MIDDLE_OF_THE_NIGHT",cat={"pop/hiphop","epic","beautiful","best"}},{button=A99DOT9,bpm="180",var=false,url="99DOT9",cat={"anime/jpop","movies/tv"}},{button=MY_EYES,bpm="120",var=false,url="MY_EYES",cat={"pop/hiphop","beautiful","best"}},{button=CRAB_RAVE,bpm="125",var=false,url="CRAB_RAVE",cat={"memes","electronic","epic"}},{button=ONE_DANCE,bpm="108",var=false,url="ONE_DANCE",cat={"pop/hiphop"}},{button=RAIN,bpm="77",var=false,url="RAIN",cat={"beautiful","best","epic"}},{button=RUSH_OF_LIFE,bpm="122",var=false,url="RUSH_OF_LIFE",cat={"beautiful","epic","best","peak"}},{button=THE_SEARCH,bpm="120",var=false,url="THE_SEARCH",cat={"pop/hiphop","epic","beautiful","best"}},{button=MICHAEL_MYERS,bpm="144",var=false,url="MICHAEL_MYERS",cat={"memes","creepy/weirdcore"}},{button=YUUSHA,bpm="208",var=false,url="YUUSHA",cat={"anime/jpop"}},{button=CAROL_OF_THE_BELLS_EPIC,bpm="135",var=false,url="CAROL_OF_THE_BELLS_EPIC",cat={"classical","epic","beautiful","best","seasonal"}},{button=CAROL_OF_THE_BELLS,bpm="50",var=false,url="CAROL_OF_THE_BELLS",cat={"classical","beautiful","best","seasonal"}},{button=CLAIR_DE_LUNE,bpm="48",var=false,url="CLAIR_DE_LUNE",cat={"classical","beautiful"}},{button=OLD_TOWN_ROAD,bpm="69",var=false,url="OLD_TOWN_ROAD",cat={"pop/hiphop","memes"}},{button=HATSUNE_MIKU_NO_GEKISHOU,bpm="200",var=false,url="HATSUNE_MIKU_NO_GEKISHOU",cat={"anime/jpop","best","epic"}},{button=AUTUMN,bpm="80",var=false,url="AUTUMN",cat={"classical"}},{button=WINTER,bpm="136",var=false,url="WINTER",cat={"classical","best","beautiful","epic","peak"}},{button=SPRING,bpm="100",var=false,url="SPRING",cat={"classical","video games","memes","best"}},{button=SUMMER,bpm="150",var=false,url="SUMMER",cat={"classical","epic","best","beautiful","peak"}},{button=TAKE_ON_ME,bpm="169",var=false,url="TAKE_ON_ME",cat={"pop/hiphop"}},{button=BIG_FISH,bpm="71",var=false,url="BIG_FISH",cat={"beautiful"}},{button=NOPE_YOUR_TOO_LATE,bpm="118",var=false,url="NOPE_YOUR_TOO_LATE",cat={"rock","sad"}},{button=INVISIBLE,bpm="82",var=false,url="INVISIBLE",cat={"electronic","beautiful","best"}},{button=PASSACAGLIA,bpm="130",var=false,url="PASSACAGLIA",cat={"classical","beautiful","best"}},{button=HAZY_MOON,bpm="120",var=false,url="HAZY_MOON",cat={"anime/jpop","beautiful"}},{button=TIME_BACK,bpm="120",var=false,url="TIME_BACK",cat={"movies/tv"}},{button=TEST_DRIVE,bpm="120",var=false,url="TEST_DRIVE",cat={"epic","movies/tv"}},{button=TAKE_FIVE,bpm="166",var=false,url="TAKE_FIVE",cat={}},{button=HEART_AFIRE,bpm="100",var=false,url="HEART_AFIRE",cat={"epic","beautiful","best"}},{button=LIEBESTRAUM_NO3,bpm="152",var=false,url="LIEBESTRAUM_NO3",cat={"classical"}},{button=TORRENT,bpm="190",var=false,url="TORRENT",cat={"classical","epic","best","peak"}},{button=REVOLUTIONARY,bpm="140",var=false,url="REVOLUTIONARY",cat={"classical","best"}},{button=WALTZ_IN_C_MINOR,bpm="120",var=false,url="WALTZ_IN_C_MINOR",cat={"classical"}},{button=PRELUDE_OP28,bpm="42",var=false,url="PRELUDE_OP28",cat={"classical"}},{button=DIES_IRAE,bpm="160",var=false,url="DIES_IRAE",cat={"classical","best","peak","epic"}},{button=PRELUDE_NO2,bpm="145",var=false,url="PRELUDE_NO2",cat={"classical"}},{button=SYMPHONY_NO5,bpm="120",var=false,url="SYMPHONY_NO5",cat={"classical"}},{button=PATHETIQUE,bpm="31",var=false,url="PATHETIQUE",cat={"classical"}},{button=COMPTINE_DUN_AUTRE_ETE,bpm="95",var=false,url="COMPTINE_DUN_AUTRE_ETE",cat={"classical","beautiful"}},{button=DIE_IRAE_III,bpm="160",var=false,url="DIE_IRAE_III",cat={"classical"}},{button=DIES_IRAE_III_2,bpm="160",var=false,url="DIES_IRAE_III_2",cat={"classical","epic","best","peak"}},{button=PLANT_VS_ZOMBIES,bpm="100",var=false,url="PLANT_VS_ZOMBIES",cat={"video games","memes"}},{button=LOVE,bpm="68",var=false,url="LOVE",cat={"sad"}},{button=STRESSED_OUT,bpm="170",var=false,url="STRESSED_OUT",cat={"pop/hiphop","best"}},{button=CLOCKS,bpm="132",var=false,url="CLOCKS",cat={"rock"}},{button=GLASSY_SKY,bpm="68",var=false,url="GLASSY_SKY",cat={"anime/jpop","sad","movies/tv"}},{button=PAYPHONE,bpm="110",var=false,url="PAYPHONE",cat={"pop/hiphop","sad","best","beautiful"}},{button=FOR_THE_DAMAGED_CODA,bpm="140",var=false,url="FOR_THE_DAMAGED_CODA",cat={"sad","memes","epic"}},{button=PARADISE,bpm="125",var=false,url="PARADISE",cat={"pop/hiphop"}},{button=PLEAD,bpm="120",var=false,url="PLEAD",cat={"video games","electronic"}},{button=READY_OR_NOT,bpm="160",var=false,url="READY_OR_NOT",cat={"video games","electronic"}},{button=FOR_THE_DAMAGED_CODA_2,bpm="150",var=false,url="FOR_THE_DAMAGED_CODA_2",cat={"sad","memes","epic","best","peak"}},{button=A7_WEEKS_3_DAYS,bpm="130",var=false,url="7_WEEKS_3_DAYS",cat={"creepy/weirdcore"}},{button=SEE_YOU_AGAIN_CHARLIE,bpm="60",var=false,url="SEE_YOU_AGAIN_CHARLIE",cat={"pop/hiphop","sad","beautiful"}},{button=ANNIHILATE,bpm="146",var=false,url="ANNIHILATE",cat={"pop/hiphop","movies/tv"}},{button=MY_HEART_WILL_GO_ON,bpm="90",var=false,url="MY_HEART_WILL_GO_ON",cat={"sad","movies/tv","beautiful","best"}},{button=NUMBERS,bpm="100",var=false,url="NUMBERS",cat={"creepy/weirdcore"}},{button=NYAN_CAT,bpm="140",var=false,url="NYAN_CAT",cat={"memes","best"}},{button=OVERTAKEN,bpm="105",var=false,url="OVERTAKEN",cat={"anime/jpop","movies/tv"}},{button=GURENGE,bpm="135",var=false,url="GURENGE",cat={"anime/jpop","movies/tv","best","epic","beautiful","peak"}},{button=CROSSING_FIELD,bpm="179",var=false,url="CROSSING_FIELD",cat={"anime/jpop","movies/tv"}},{button=UNTIL_I_FOUND_YOU,bpm="101",var=false,url="UNTIL_I_FOUND_YOU",cat={"pop/hiphop","sad","beautiful","best"}},{button=OLD_DOLL,bpm="100",var=false,url="OLD_DOLL",cat={"creepy/weirdcore"}},{button=WE_ARE,bpm="168",var=false,url="WE_ARE",cat={"anime/jpop","movies/tv"}},{button=RIGHTEOUS,bpm="160",var=false,url="RIGHTEOUS",cat={"electronic"}},{button=SILHOUETTE,bpm="185",var=false,url="SILHOUETTE",cat={"anime/jpop","movies/tv"}},{button=LET_IT_HAPPEN,bpm="120",var=false,url="LET_IT_HAPPEN",cat={"rock","beautiful"}},{button=BEANIE,bpm="135",var=false,url="BEANIE",cat={"sad"}},{button=ALTALE,bpm="90",var=false,url="ALTALE",cat={"electronic"}},{button=LET_ME_DOWN_SLOWLY,bpm="75",var=false,url="LET_ME_DOWN_SLOWLY",cat={"sad"}},{button=RUSH_C,bpm="60",var=false,url="RUSH_C",cat={}},{button=RUSH_F,bpm="60",var=false,url="RUSH_F",cat={}},{button=RUSH_G,bpm="60",var=false,url="RUSH_G",cat={}},{button=BEAUTIFUL_THINGS,bpm="70",var=false,url="BEAUTIFUL_THINGS",cat={"rock","pop/hiphop"}},{button=OBLIVION,bpm="156",var=false,url="OBLIVION",cat={"rock","beautiful"}},{button=A_CYBERS_WORLD,bpm="117",var=false,url="A_CYBERS_WORLD",cat={"deltarune","video games","best"}},{button=DEXTER_BLOOD_THEME,bpm="82",var=false,url="DEXTER_BLOOD_THEME",cat={"movies/tv"}},{button=PASSO_BEM_SOLTO,bpm="120",var=false,url="PASSO_BEM_SOLTO",cat={"electronic"}},{button=MINGLE,bpm="105",var=false,url="MINGLE",cat={"creepy/weirdcore","movies/tv"}},{button=LUX_AETERNA,bpm="70",var=false,url="LUX_AETERNA",cat={"movies/tv"}},{button=FIELD_OF_HOPES_AND_DREAMS,bpm="125",var=false,url="FIELD_OF_HOPES_AND_DREAMS",cat={"deltarune","video games"}},{button=CHAOS_KING,bpm="148",var=false,url="CHAOS_KING",cat={"deltarune","video games"}},{button=BIG_SHOT,bpm="280",var=false,url="BIG_SHOT",cat={"deltarune","video games"}},{button=THE_WORLD_REVOLVING,bpm="190",var=false,url="THE_WORLD_REVOLVING",cat={"deltarune","video games","best"}},{button=RUDE_BUSTER,bpm="140",var=false,url="RUDE_BUSTER",cat={"deltarune","video games","best"}},{button=TIME_FLOWS_EVER_ONWARD,bpm="100",var=false,url="TIME_FLOWS_EVER_ONWARD",cat={"movies/tv","anime/jpop"}},{button=IDEA_10,bpm="170",var=false,url="IDEA_10",cat={"beautiful"}},{button=CREEP,bpm="100",var=false,url="CREEP",cat={"rock","sad"}},{button=MASTER_OF_PUPPETS,bpm="220",var=false,url="MASTER_OF_PUPPETS",cat={"rock"}},{button=NOTHING_ELSE_MATTERS,bpm="75",var=false,url="NOTHING_ELSE_MATTERS",cat={"rock","sad"}},{button=MY_LOVE_ALL_MINE,bpm="57",var=false,url="MY_LOVE_ALL_MINE",cat={"sad","best"}},{button=NO_SURPRISES,bpm="80",var=false,url="NO_SURPRISES",cat={"rock","sad"}},{button=ORDER,bpm="170",var=false,url="ORDER",cat={"video games","best"}},{button=RUNAWAY_AURORA,bpm="90",var=false,url="RUNAWAY_AURORA",cat={"sad","beautiful","best"}},{button=IM_NOT_THE_ONLY_ONE,bpm="80",var=false,url="IM_NOT_THE_ONLY_ONE",cat={"pop/hiphop","sad"}},{button=UNSTOPPABLE,bpm="85",var=false,url="UNSTOPPABLE",cat={"pop/hiphop","best"}},{button=ZOMBIE,bpm="164",var=false,url="ZOMBIE",cat={"rock"}},{button=MY_CASTLE_TOWN,bpm="136",var=false,url="MY_CASTLE_TOWN",cat={"video games","deltarune"}},{button=SCARLET_FOREST,bpm="122",var=false,url="SCARLET_FOREST",cat={"video games","deltarune"}},{button=THE_LEGEND,bpm="110",var=false,url="THE_LEGEND",cat={"video games","deltarune"}},{button=ATTACK_OF_THE_KILLER_QUEEN,bpm="144",var=false,url="ATTACK_OF_THE_KILLER_QUEEN",cat={"video games","deltarune","best"}},{button=BELLA_CIAO,bpm="136",var=false,url="BELLA_CIAO",cat={"movies/tv","best"}},{button=DAISY_BELL,bpm="120",var=false,url="DAISY_BELL",cat={"creepy/weirdcore"}},{button=ORDINARY,bpm="168",var=false,url="ORDINARY",cat={"pop/hiphop","sad","beautiful","best"}},{button=ETHEREAL,bpm="132",var=false,url="ETHEREAL",cat={"beautiful","best","peak"}},{button=BOHEMIAN_RHAPSODY,bpm="80",var=false,url="BOHEMIAN_RHAPSODY",cat={"rock"}},{button=RIPTIDE,bpm="90",var=false,url="RIPTIDE",cat={"pop/hiphop"}},{button=SAILOR_SONG,bpm="83",var=false,url="SAILOR_SONG",cat={"sad"}},{button=GIMME_GIMME_GIMME,bpm="116",var=false,url="GIMME_GIMME_GIMME",cat={"pop/hiphop"}},{button=BARBIE_GIRL,bpm="136",var=false,url="BARBIE_GIRL",cat={"movies/tv","memes"}},{button=WHAT_IS_LOVE,bpm="120",var=false,url="WHAT_IS_LOVE",cat={"pop/hiphop","electronic"}},{button=DRAGOSTEA_DIN_TEI,bpm="130",var=false,url="DRAGOSTEA_DIN_TEI",cat={"pop/hiphop","electronic","memes"}},{button=STAYIN_ALIVE,bpm="103",var=false,url="STAYIN_ALIVE",cat={"pop/hiphop","rock","movies/tv"}},{button=CLOSE_EYES,bpm="114",var=false,url="CLOSE_EYES",cat={"electronic"}},{button=BOOM_BOOM_BOOM_BOOM,bpm="120",var=false,url="BOOM_BOOM_BOOM_BOOM",cat={"pop/hiphop","memes"}},{button=FUNK_ESTRANHO,bpm="111",var=false,url="FUNK_ESTRANHO",cat={"electronic"}},{button=GUREN_NO_YUMIYA,bpm="176",var=false,url="GUREN_NO_YUMIYA",cat={"movies/tv","anime/jpop","epic"}},{button=IDEA_1,bpm="160",var=false,url="IDEA_1",cat={"classical"}},{button=COMEDY,bpm="88",var=false,url="COMEDY",cat={"movies/tv","anime/jpop"}},{button=LET_IT_GO,bpm="74",var=false,url="LET_IT_GO",cat={"movies/tv","memes","best"}},{button=BETTER_OFF_ALONE,bpm="130",var=false,url="BETTER_OFF_ALONE",cat={"electronic","pop/hiphop"}},{button=MY_WAR,bpm="140",var=false,url="MY_WAR",cat={"movies/tv","anime/jpop"}},{button=AFRICA,bpm="90",var=false,url="AFRICA",cat={"electronic","memes"}},{button=KICK_BACK,bpm="204",var=false,url="KICK_BACK",cat={"movies/tv","anime/jpop"}},{button=REVENGE,bpm="120",var=false,url="REVENGE",cat={"video games","video games","memes","best"}},{button=SPECIALZ,bpm="117",var=false,url="SPECIALZ",cat={"movies/tv","anime/jpop"}},{button=F1,bpm="110",var=false,url="F1",cat={"movies/tv"}},{button=MONTAGEM_CORAL,bpm="130",var=false,url="MONTAGEM_CORAL",cat={"electronic"}},{button=RUNNING_IN_THE_90S,bpm="160",var=false,url="RUNNING_IN_THE_90S",cat={"electronic","memes","best"}},{button=A_CRUEL_ANGELS_THESIS,bpm="76",var=false,url="A_CRUEL_ANGELS_THESIS",cat={"movies/tv","anime/jpop","best"}},{button=BLUEBIRD,bpm="145",var=false,url="BLUEBIRD",cat={"anime/jpop","movies/tv"}},{button=IM_INVINCIBLE,bpm="192",var=false,url="IM_INVINCIBLE",cat={"anime/jpop","movies/tv"}},{button=LAMOUR_TOUJOURS,bpm="160",var=false,url="LAMOUR_TOUJOURS",cat={"sad","memes"}},{button=CRAZY_FROG,bpm="130",var=false,url="CRAZY_FROG",cat={"memes","electronic"}},{button=YOUR_GAZE,bpm="144",var=false,url="YOUR_GAZE",cat={"anime/jpop","movies/tv","beautiful","best"}},{button=SHINZOU_WO_SASEGEYO,bpm="80",var=false,url="SHINZOU_WO_SASEGEYO",cat={"anime/jpop","movies/tv"}},{button=A2_PHUT_HON,bpm="130",var=false,url="2_PHUT_HON",cat={"electronic","best"}},{button=I_CANT_HANDLE_CHANGE,bpm="120",var=false,url="I_CANT_HANDLE_CHANGE",cat={"sad","rock"}},{button=HANA_NI_NATTE,bpm="200",var=false,url="HANA_NI_NATTE",cat={"anime/jpop","movies/tv"}},{button=IDEA_9,bpm="195",var=false,url="IDEA_9",cat={"classical"}},{button=IDEA_22,bpm="120",var=false,url="IDEA_22",cat={"classical"}},{button=A90210,bpm="70",var=false,url="A90210",cat={"pop/hiphop"}},{button=I_BROKE_A_STRING,bpm="120",var=false,url="I_BROKE_A_STRING",cat={"beautiful","best","epic"}},{button=THE_BEGINNING,bpm="150",var=false,url="THE_BEGINNING",cat={"beautiful"}},{button=GYMNOPEDIE_NO1,bpm="54",var=false,url="GYMNOPEDIE_NO1",cat={"classical"}},{button=CRY_FOR_ME_MICHITA,bpm="92",var=false,url="CRY_FOR_ME_MICHITA",cat={"beautiful","sad"}},{button=DARK_IS_THE_NIGHT,bpm="120",var=false,url="DARK_IS_THE_NIGHT",cat={"sad"}},{button=MY_WAY,bpm="80",var=false,url="MY_WAY",cat={}},{button=STILL_DRE,bpm="92",var=false,url="STILL_DRE",cat={"pop/hiphop","best"}},{button=THE_BLUE_DANUBE,bpm="120",var=false,url="THE_BLUE_DANUBE",cat={"classical"}},{button=NEVER_BE_ALONE,bpm="105",var=false,url="NEVER_BE_ALONE",cat={"video games"}},{button=RUDER_BUSTER,bpm="130",var=false,url="RUDER_BUSTER",cat={"video games","deltarune"}},{button=LOVER_IS_A_DAY,bpm="90",var=false,url="LOVER_IS_A_DAY",cat={}},{button=DANDELIONS,bpm="100",var=false,url="DANDELIONS",cat={}},{button=MY_KIND_OF_WOMAN,bpm="90",var=false,url="MY_KIND_OF_WOMAN",cat={}},{button=WHEN_I_MET_YOU,bpm="70",var=false,url="WHEN_I_MET_YOU",cat={}},{button=SADNESS_AND_SORROW,bpm="75",var=false,url="SADNESS_AND_SORROW",cat={"anime/jpop","movies/tv"}},{button=THIS_IS_WHAT_FALLING_IN_LOVE,bpm="80",var=false,url="THIS_IS_WHAT_FALLING_IN_LOVE",cat={"beautiful","pop/hiphop"}},{button=CHA_LA_HEAD_CHA_LA,bpm="154",var=false,url="CHA_LA_HEAD_CHA_LA",cat={"anime/jpop","movies/tv","best"}},{button=UWA_SO_TEMPERATE,bpm="130",var=false,url="UWA_SO_TEMPERATE",cat={"undertale","video games"}},{button=WE_WERE_ANGELS,bpm="148",var=false,url="WE_WERE_ANGELS",cat={"anime/jpop","movies/tv"}},{button=WIEGE,bpm="75",var=false,url="WIEGE",cat={"movies/tv"}},{button=DEPARTURE,bpm="150",var=false,url="DEPARTURE",cat={"movies/tv","anime/jpop"}},{button=RUE_DES_TROIS_FRERES,bpm="120",var=false,url="RUE_DES_TROIS_FRERES",cat={"classical"}},{button=ITS_TV_TIME,bpm="148",var=false,url="ITS_TV_TIME",cat={"deltarune","video games"}},{button=CONCERTO_OP30_NO3,bpm="150",var=false,url="CONCERTO_OP30_NO3",cat={"classical"}},{button=MORNING_MOOD,bpm="72",var=false,url="MORNING_MOOD",cat={"classical","memes","video games"}},{button=ETUDE_NO3_UN_SOSPIRO,bpm="25",var=false,url="ETUDE_NO3_UN_SOSPIRO",cat={"classical"}},{button=SERENADE,bpm="58",var=false,url="SERENADE",cat={"classical"}},{button=POLONAISE,bpm="100",var=false,url="POLONAISE",cat={"classical"}},{button=VIENNA,bpm="120",var=false,url="VIENNA",cat={}},{button=ONE_SUMMERS_DAY,bpm="78",var=false,url="ONE_SUMMERS_DAY",cat={"beautiful","movies/tv","anime/jpop"}},{button=LE_MONDE,bpm="100",var=false,url="LE_MONDE",cat={"best"}},{button=JUDAS,bpm="130",var=false,url="JUDAS",cat={"pop/hiphop"}},{button=GYMONPEDIE_NO2,bpm="48",var=false,url="GYMONPEDIE_NO2",cat={"classical"}},{button=LIKE_HIM_BEST,bpm="94",var=false,url="LIKE_HIM_BEST",cat={"beautiful","best","peak","pop/hiphop","epic"}},{button=WATERFALL,bpm="70",var=false,url="WATERFALL",cat={"video games","undertale"}},{button=KISS_THE_RAIN,bpm="58",var=false,url="KISS_THE_RAIN",cat={}},{button=KAMADO_TANJIRO_NO_UTA,bpm="151",var=false,url="KAMADO_TANJIRO_NO_UTA",cat={"anime/jpop","movies/tv"}},{button=ON_MY_WAY,bpm="85",var=false,url="ON_MY_WAY",cat={"electronic"}},{button=A7_YEARS,bpm="60",var=false,url="A7_YEARS",cat={"pop/hiphop","sad","best"}},{button=PIANO_MAN,bpm="80",var=false,url="PIANO_MAN",cat={""}},{button=NIGHT_DANCER,bpm="118",var=false,url="NIGHT_DANCER",cat={"pop/hiphop","best"}},{button=LET_YOU_BREAK_MY_HEART_AGAIN,bpm="73",var=false,url="LET_YOU_BREAK_MY_HEART_AGAIN",cat={"sad"}},{button=WHAT_WAS_I_MADE_FOR,bpm="80",var=false,url="WHAT_WAS_I_MADE_FOR",cat={"movies/tv","pop/hiphop"}},{button=SPAWN,bpm="140",var=false,url="SPAWN",cat={"deltarune","video games"}},{button=ALL_I_WANT_FOR_CHRISTMAS_IS_YOU,bpm="70",var=false,url="ALL_I_WANT_FOR_CHRISTMAS_IS_YOU",cat={"pop/hiphop","seasonal"}},{button=IN_HELL_WE_LIVE,bpm="65",var=false,url="IN_HELL_WE_LIVE",cat={"video games"}},{button=SPOOKY_SCARY_SKELETONS,bpm="225",var=false,url="SPOOKY_SCARY_SKELETONS",cat={"creepy/weirdcore","best"}},{button=A_HOME_FOR_FLOWERS,bpm="54",var=false,url="A_HOME_FOR_FLOWERS",cat={"omori","video games"}},{button=MONTAGEM_XONADA,bpm="130",var=false,url="MONTAGEM_XONADA",cat={"electronic"}},{button=BLACK_KNIFE,bpm="148",var=false,url="BLACK_KNIFE",cat={"deltarune","video games"}},{button=RENAI_CIRCULATION,bpm="120",var=false,url="RENAI_CIRCULATION",cat={"anime/jpop","memes","peak","best"}},{button=CHIISANA_KOI_NO_UTA,bpm="100",var=false,url="CHIISANA_KOI_NO_UTA",cat={"anime/jpop","movies/tv","best"}},{button=WHERE_OUR_BLUE_IS,bpm="152",var=false,url="WHERE_OUR_BLUE_IS",cat={"anime/jpop","movies/tv"}},{button=CHAMBER_OF_REFLECTION,bpm="128",var=false,url="CHAMBER_OF_REFLECTION",cat={"sad","beautiful","best"}},{button=SWAN_LAKE,bpm="100",var=false,url="SWAN_LAKE",cat={"classical"}},{button=BUTCHER_VANITY,bpm="142",var=false,url="BUTCHER_VANITY",cat={"video games"}},{button=THIS_IS_HALLOWEEN,bpm="160",var=false,url="THIS_IS_HALLOWEEN",cat={"creepy/weirdcore"}},{button=CANT_HELP_FALLING_IN_LOVE,bpm="120",var=false,url="CANT_HELP_FALLING_IN_LOVE",cat={""}},{button=LIKE_HIM,bpm="94",var=false,url="LIKE_HIM",cat={"pop/hiphop","beautiful","best"}},{button=CRUCIFIED,bpm="144",var=false,url="CRUCIFIED",cat={"pop/hiphop"}},{button=BLACK_CATCHER,bpm="88",var=false,url="BLACK_CATCHER",cat={"anime/jpop","movies/tv"}},{button=LOVELY,bpm="115",var=false,url="LOVELY",cat={"pop/hiphop"}},{button=HEY_KIDS,bpm="87",var=false,url="HEY_KIDS",cat={"creepy/weirdcore"}},{button=SNOWMAN,bpm="105",var=false,url="SNOWMAN",cat={"pop/hiphop"}},{button=PIXEL_PEEKER_POLKA,bpm="145",var=false,url="PIXEL_PEEKER_POLKA",cat={"memes"}},{button=FAST,bpm="86",var=false,url="FAST",cat={"pop/hiphop","sad"}},{button=GYMNOPEDIE_NO3,bpm="48",var=false,url="GYMNOPEDIE_NO3",cat={"classical"}},{button=REFLECTIONS,bpm="104",var=false,url="REFLECTIONS",cat={"anime/jpop","best"}},{button=LOVE_STORY,bpm="180",var=false,url="LOVE_STORY",cat={""}},{button=HELLO_ADELE,bpm="85",var=false,url="HELLO_ADELE",cat={"pop/hiphop"}},{button=LET_IT_GO_X_LET_HER_GO,bpm="120",var=false,url="LET_IT_GO_X_LET_HER_GO",cat={""}},{button=I_WONDER,bpm="90",var=false,url="I_WONDER",cat={"pop/hiphop","beautiful"}},{button=RANSOM,bpm="180",var=false,url="RANSOM",cat={"pop/hiphop"}},{button=LET_HER_GO,bpm="120",var=false,url="LET_HER_GO",cat={"memes","pop/hiphop"}},{button=TIMELESS,bpm="120",var=false,url="TIMELESS",cat={"pop/hiphop"}},{button=JUST_THE_TWO_OF_US,bpm="120",var=false,url="JUST_THE_TWO_OF_US",cat={""}},{button=TEK_IT,bpm="147",var=false,url="TEK_IT",cat={""}},{button=FLY_MY_WINGS,bpm="72",var=false,url="FLY_MY_WINGS",cat={"video games"}},{button=AI_SCREAM,bpm="135",var=false,url="AI_SCREAM",cat={"anime/jpop"}},{button=HOLLOW_KNIGHT_MAIN_THEME,bpm="55",var=false,url="HOLLOW_KNIGHT_MAIN_THEME",cat={"video games"}},{button=HIDE,bpm="100",var=false,url="HIDE",cat={"beautiful"}},{button=LAST_GOODBYE,bpm="180",var=false,url="LAST_GOODBYE",cat={"undertale","video games","best","epic","peak"}},{button=DAD_BATTLE,bpm="180",var=false,url="DAD_BATTLE",cat={"video games"}},{button=YOUR_POWER,bpm="130",var=false,url="YOUR_POWER",cat={"pop/hiphop"}},{button=WE_ARE_NUMBER_ON,bpm="168",var=false,url="WE_ARE_NUMBER_ON",cat={"memes"}},{button=NEW_HOME,bpm="100",var=false,url="NEW_HOME",cat={}},{button=DIE_FOR_YOU,bpm="66",var=false,url="DIE_FOR_YOU",cat={"pop/hiphop","best"}},{button=DIRTMOUTH,bpm="87",var=false,url="DIRTMOUTH",cat={"video games"}},{button=NERVES,bpm="100",var=false,url="NERVES",cat={"video games"}},{button=SWEET_DREAMS,bpm="125",var=false,url="SWEET_DREAMS",cat={"pop/hiphop","best"}},{button=HERO,bpm="220",var=false,url="HERO",cat={"video games","best"}},{button=SILLY_BILLY,bpm="173",var=false,url="SILLY_BILLY",cat={"video games"}},{button=VAN_GOGH,bpm="110",var=false,url="VAN_GOGH",cat={"classical","beautiful"}},{button=GONE_ANGELS,bpm="188",var=false,url="GONE_ANGELS",cat={"video games"}},{button=ONE_OF_THE_GIRLS,bpm="88",var=false,url="ONE_OF_THE_GIRLS",cat={"pop/hiphop","movies/tv"}},{button=ROI,bpm="110",var=false,url="ROI",cat={"pop/hiphop","best"}},{button=PASILYO,bpm="125",var=false,url="PASILYO",cat={}},{button=ROBBERY,bpm="80",var=false,url="ROBBERY",cat={"pop/hiphop","sad"}},{button=CHILDREN,bpm="137",var=false,url="CHILDREN",cat={"electronic","sad","best"}},{button=CONGRATULATIONS,bpm="60",var=false,url="CONGRATULATIONS",cat={"beautiful","sad"}},{button=ITS_RAINING_SOMEWHERE_ELSE,bpm="96",var=false,url="ITS_RAINING_SOMEWHERE_ELSE",cat={"video games","undertale"}},{button=WE_NOT_LIKE_U,bpm="155",var=false,url="WE_NOT_LIKE_U",cat={"pop/hiphop","memes"}},{button=FLIGHT,bpm="80",var=false,url="FLIGHT",cat={"movies/tv"}},{button=KEEP_UP,bpm="135",var=false,url="KEEP_UP",cat={"pop/hiphop","electronic"}},{button=A_TALE_OF_SIX,bpm="165",var=false,url="A_TALE_OF_SIX",cat={"electronic","anime/jpop","movies/tv"}},{button=MULTO,bpm="104",var=false,url="MULTO",cat={"pop/hiphop","best"}},{button=YLANG_YLANG,bpm="71",var=false,url="YLANG_YLANG",cat={"sad","beautiful","memes","best"}},{button=LAST_CHRISTMAS,bpm="120",var=false,url="LAST_CHRISTMAS",cat={"pop/hiphop","best","seasonal"}},{button=CREEPIN,bpm="98",var=false,url="CREEPIN",cat={"pop/hiphop","best"}},{button=FEEL_GOOD_INC,bpm="100",var=false,url="FEEL_GOOD_INC",cat={"pop/hiphop","rock","best"}},{button=ALL_STAR,bpm="100",var=false,url="ALL_STAR",cat={"movies/tv","memes"}},{button=SUPER_SMASH_BROS,bpm="145",var=false,url="SUPER_SMASH_BROS",cat={"video games"}},{button=NEVER_SEE_ME_AGAIN,bpm="178",var=false,url="NEVER_SEE_ME_AGAIN",cat={"pop/hiphop","best"}},{button=BIRDLAND,bpm="155",var=false,url="BIRDLAND",cat={}},{button=AMOUR_PLASTIQUE,bpm="120",var=false,url="AMOUR_PLASTIQUE",cat={"sad","memes"}},{button=GEOMETRICAL_DOMINATOR,bpm="80",var=false,url="GEOMETRICAL_DOMINATOR",cat={"video games","electronic","geometry dash"}},{button=SLOW_DANCING_IN,bpm="89",var=false,url="SLOW_DANCING_IN",cat={"sad","pop/hiphop"}},{button=HOME,bpm="115",var=false,url="HOME",cat={"undertale","video games"}},{button=MRS_MAGIC,bpm="120",var=false,url="MRS_MAGIC",cat={}},{button=CALL_OUT_MY_NAME,bpm="67",var=false,url="CALL_OUT_MY_NAME",cat={"pop/hiphop"}},{button=GOLDEN_BROW,bpm="94",var=false,url="GOLDEN_BROW",cat={"rock"}},{button=THE_REAL_SLIM_SHADY,bpm="105",var=false,url="THE_REAL_SLIM_SHADY",cat={"pop/hiphop"}},{button=AROUND_THE_WORLD,bpm="121",var=false,url="AROUND_THE_WORLD",cat={"electronic","pop/hiphop"}},{button=NEW_COMPUTERS,bpm="120",var=false,url="NEW_COMPUTERS",cat={"memes","best"}},{button=TIME,bpm="60",var=false,url="TIME",cat={"movies/tv","beautiful","epic"}},{button=THIS_IS_WHAT_SPACE,bpm="130",var=false,url="THIS_IS_WHAT_SPACE",cat={"beautiful","pop/hiphop"}},{button=PROPOSE,bpm="126",var=false,url="PROPOSE",cat={"anime/jpop","best","epic","new"}},{button=BEAUTIFUL_IN_WHITE,bpm="120",var=false,url="BEAUTIFUL_IN_WHITE",cat={"new"}},{button=KISS_OF_DEATH,bpm="122",var=false,url="KISS_OF_DEATH",cat={"anime/jpop","beautiful","best","epic","movies/tv","new"}},{button=TRANSCEDENTAL_ETUDE_4,bpm="120",var=false,url="TRANSCEDENTAL_ETUDE_4",cat={"classical","best","epic","new"}},{button=VOILA,bpm="102",var=false,url="VOILA",cat={"new"}},{button=JINGLE_BELLS,bpm="110",var=false,url="JINGLE_BELLS",cat={"seasonal","new"}},{button=SANTA_CLAUS_IS_COMING,bpm="120",var=false,url="SANTA_CLAUS_IS_COMING",cat={"seasonal","new"}},{button=SINKING_TOWN,bpm="125",var=false,url="SINKING_TOWN",cat={"anime/jpop","best","new"}},{button=JINGLE_BELL_ROCK,bpm="138",var=false,url="JINGLE_BELL_ROCK",cat={"seasonal","rock","best","new"}},{button=LIFE_WILL_CHANGE,bpm="130",var=false,url="LIFE_WILL_CHANGE",cat={"video games","anime/jpop","new"}},{button=TREACHERY,bpm="90",var=false,url="TREACHERY",cat={"anime/jpop","movies/tv","epic","best","new"}},{button=MERRY_CHRISTMAS_MR_LAWRENCE,bpm="102",var=false,url="MERRY_CHRISTMAS_MR_LAWRENCE",cat={"anime/jpop","new"}},{button=DECK_THE_HALLS,bpm="144",var=false,url="DECK_THE_HALLS",cat={"seasonal","beautiful","new"}},{button=THE_ABYSS,bpm="70",var=false,url="THE_ABYSS",cat={"pop/hiphop","new"}},{button=IN_THE_POOL,bpm="91",var=false,url="IN_THE_POOL",cat={"anime/jpop","movies/tv","new"}},{button=THANG_DIEN,bpm="120",var=false,url="THANG_DIEN",cat={"new"}},{button=HERE_TO_STAY,bpm="70",var=false,url="HERE_TO_STAY",cat={"anime/jpop","movies/tv","new"}},{button=ONCE_UPON_A_DECEMBER,bpm="120",var=false,url="ONCE_UPON_A_DECEMBER",cat={"seasonal","movies/tv","new"}},{button=LEAVE_THE_DOOR_OPEN,bpm="74",var=false,url="LEAVE_THE_DOOR_OPEN",cat={"pop/hiphop","new"}},{button=IRIS_OUT,bpm="135",var=false,url="IRIS_OUT",cat={"anime/jpop","movies/tv","new"}},{button=DIED_IN_YOUR_ARMS,bpm="123",var=false,url="DIED_IN_YOUR_ARMS",cat={"rock","sad","new"}},{button=I_HATE_U_I_LOVE_U,bpm="90",var=false,url="I_HATE_U_I_LOVE_U",cat={"pop/hiphop","sad","new"}},{button=SAITAMAS_THEME,bpm="84",var=false,url="SAITAMAS_THEME",cat={"anime/jpop","movies/tv","sad","beautiful","new"}},{button=FLIGHT_OF_THE_BUMBLEBEE,bpm="190",var=false,url="FLIGHT_OF_THE_BUMBLEBEE",cat={"classical","new"}},{button=WE_WISH_YOU_A_MERRY,bpm="160",var=false,url="WE_WISH_YOU_A_MERRY",cat={"seasonal","new"}},{button=THIS_IS_HOME,bpm="130",var=false,url="THIS_IS_HOME",cat={"new"}},{button=THE_WINNER_TAKES_IT_ALL,bpm="126",var=false,url="THE_WINNER_TAKES_IT_ALL",cat={"pop/hiphop","new"}},{button=THROUGH_PATCHES_OF_VIOLET,bpm="160",var=false,url="THROUGH_PATCHES_OF_VIOLET",cat={"video games","electronic","new"}},{button=BINKS_RUM,bpm="120",var=false,url="BINKS_RUM",cat={"anime/jpop","movies/tv","new"}}}
local v129, v130, v131 = ipairs(vu128)
while true do
    local v132
    v131, v132 = v129(v130, v131)
    if v131 == nil then
        break
    end
    print("song loaded: " .. v132.button.Name)
end
local v133, v134, v135 = ipairs(vu128)
while true do
    local v136
    v135, v136 = v133(v134, v135)
    if v135 == nil then
        break
    end
    v136.button:SetAttribute("OriginalLayoutOrder", v136.button.LayoutOrder)
end
local v137, v138, v139 = ipairs(vu128)
local v140 = {
    "new",
    "peak",
    "best",
    "epic",
    "beautiful",
    "video games",
    "movies/tv",
    "memes",
    "classical",
    "pop/hiphop",
    "anime/jpop",
    "seasonal",
    "sad",
    "electronic",
    "rock",
    "creepy/weirdcore",
    "undertale",
    "deltarune",
    "geometry dash",
    "minecraft",
    "omori"
}
while true do
    local v141
    v139, v141 = v137(v138, v139)
    if v139 == nil then
        break
    end
    local v142, v143, v144 = ipairs(v141.cat)
    while true do
        local v145
        v144, v145 = v142(v143, v144)
        if v144 == nil then
            break
        end
        local v146 = v141.button:GetAttribute("AlternateNames") or ""
        local v147 = v146 == "" and {} or string.split(v146, ",")
        table.insert(v147, v145)
        v141.button:SetAttribute("AlternateNames", table.concat(v147, ","))
    end
end
local vu148 = false
local vu149 = {}
local vu150 = {}
local vu151 = {}
print("initiating buttons")
print("fetching songs")
local vu152 = Instance.new("TextLabel")
vu152.Name = "customnotice"
vu152.Parent = vu42
vu152.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
vu152.BorderColor3 = Color3.fromRGB(64, 68, 90)
vu152.BorderSizePixel = 4
vu152.Size = UDim2.new(0, 175, 0, 75)
vu152.Font = Enum.Font.SourceSansBold
vu152.Text = vu17("unsupported executor")
vu152.TextColor3 = Color3.fromRGB(255, 255, 255)
vu152.TextSize = 25
vu152.TextWrapped = true
local vu153 = {}
local vu154 = {}
local vu155 = Instance.new("TextButton")
vu155.Parent = vu39
vu155.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
vu155.BorderColor3 = Color3.fromRGB(64, 68, 90)
vu155.BorderSizePixel = 2
vu155.Size = UDim2.new(0, 100, 0, 25)
vu155.Font = Enum.Font.SourceSansBold
vu155.Text = vu17("utilities") .. " \226\150\178"
vu155.TextColor3 = Color3.fromRGB(255, 255, 255)
vu155.TextSize = 18
vu155.LayoutOrder = 1
vu21(vu155)
local vu156 = Instance.new("TextButton")
vu156.Parent = vu39
vu156.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
vu156.BorderColor3 = Color3.fromRGB(64, 68, 90)
vu156.BorderSizePixel = 2
vu156.Size = UDim2.new(0, 100, 0, 25)
vu156.Font = Enum.Font.SourceSansBold
vu156.Text = vu17("categories") .. " \226\150\178"
vu156.TextColor3 = Color3.fromRGB(255, 255, 255)
vu156.TextSize = 18
vu156.LayoutOrder = 100
vu21(vu156)
local vu157 = false
local vu158 = false
vu155.MouseButton1Click:Connect(function()
    vu158 = not vu158
    local v159, v160, v161 = ipairs(vu154)
    while true do
        local v162
        v161, v162 = v159(v160, v161)
        if v161 == nil then
            break
        end
        v162.Visible = vu158
    end
    if vu158 then
        vu155.Text = vu17("utilities") .. " \226\150\188"
    else
        vu155.Text = vu17("utilities") .. " \226\150\178"
    end
end)
vu156.MouseButton1Click:Connect(function()
    vu157 = not vu157
    local v163, v164, v165 = ipairs(vu153)
    while true do
        local v166
        v165, v166 = v163(v164, v165)
        if v165 == nil then
            break
        end
        v166.Visible = vu157
    end
    if vu157 then
        vu156.Text = vu17("categories") .. " \226\150\188"
    else
        vu156.Text = vu17("categories") .. " \226\150\178"
    end
end)
local function v170(p167, p168, _)
    local v169 = Instance.new("TextButton")
    v169.Parent = vu39
    v169.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    v169.BorderColor3 = Color3.fromRGB(64, 68, 90)
    v169.BorderSizePixel = 2
    v169.Size = UDim2.new(0, 100, 0, 25)
    v169.Font = Enum.Font.SourceSans
    v169.Text = p167
    v169.TextColor3 = Color3.fromRGB(255, 255, 255)
    v169.TextSize = 14
    v169.Visible = false
    vu21(v169)
    if p168 == "cat" then
        table.insert(vu153, v169)
        v169.LayoutOrder = # vu153 + 101
    elseif p168 == "utils" then
        table.insert(vu154, v169)
        v169.LayoutOrder = # vu154 + 1
    end
    return v169
end
local function vu183()
    local v171, v172, v173 = ipairs(vu128)
    while true do
        local v174
        v173, v174 = v171(v172, v173)
        if v173 == nil then
            break
        end
        v174.button.Visible = false
        v174.button.LayoutOrder = v174.button:GetAttribute("OriginalLayoutOrder") or v174.button.LayoutOrder
    end
    local v175, v176, v177 = ipairs(vu149)
    while true do
        local v178
        v177, v178 = v175(v176, v177)
        if v177 == nil then
            break
        end
        v178.buttonFrame.Visible = false
        v178.buttonFrame.LayoutOrder = v178.buttonFrame:GetAttribute("OriginalLayoutOrder") or v178.buttonFrame.LayoutOrder
    end
    local v179, v180, v181 = ipairs(vu151)
    while true do
        local v182
        v181, v182 = v179(v180, v181)
        if v181 == nil then
            break
        end
        v182.Visible = false
    end
    removePlaylistArrows()
    PLAYRANDOM.Visible = false
    LOOPRANDOM.Visible = false
    PLAYPLAYLISTBUTTON.Visible = false
    SHUFFLEPLAYLISTBUTTON.Visible = false
    if NEWSONGBUTTON then
        NEWSONGBUTTON.Visible = false
    end
    if vu152 then
        vu152.Visible = false
    end
end
local function vu192()
    local v184, v185, v186 = ipairs(vu128)
    while true do
        local v187
        v186, v187 = v184(v185, v186)
        if v186 == nil then
            break
        end
        if v187.var == true then
            if table.find(vu151, v187.button) then
                vu57.Image = vu24
            else
                vu57.Image = vu23
            end
            if table.find(vu150, v187) then
                vu58.Image = vu26
            else
                vu58.Image = vu25
            end
        end
    end
    local v188, v189, v190 = ipairs(vu149)
    while true do
        local v191
        v190, v191 = v188(v189, v190)
        if v190 == nil then
            break
        end
        if v191.var == true then
            if table.find(vu151, v191.buttonFrame) then
                vu57.Image = vu24
            else
                vu57.Image = vu23
            end
            if table.find(vu150, v191) then
                vu58.Image = vu26
            else
                vu58.Image = vu25
            end
        end
    end
end
local function vu196(p193)
    if not STOPLOOP then
        local vu194 = Instance.new("TextButton", vu48)
        vu194.BorderSizePixel = 4
        vu194.TextSize = 25
        vu194.TextColor3 = Color3.fromRGB(255, 255, 255)
        vu194.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
        vu194.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        vu194.Size = UDim2.new(0, 125, 0, 27)
        vu194.Name = "stoploop"
        vu194.BorderColor3 = Color3.fromRGB(64, 68, 90)
        local v195
        if p193 == "looprandom" then
            v195 = vu17("stoploopingsongs")
        elseif p193 == "playlist" then
            v195 = vu17("stopplayingplaylist")
        else
            v195 = vu17("stoploopingsongs")
        end
        vu194.Text = v195
        vu194.LayoutOrder = 4
        vu21(vu194)
        vu194.MouseButton1Click:Connect(function()
            playingall = false
            vu194:Destroy()
            stopPlayingSongs()
            vu194 = nil
        end)
    end
end
local function vu201(p197)
    local v198 = Instance.new("TextLabel")
    v198.Parent = vu59
    v198.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    v198.BorderSizePixel = 0
    v198.Size = UDim2.new(0, 0, 0, 21)
    v198.Font = Enum.Font.SourceSans
    v198.TextColor3 = Color3.fromRGB(255, 255, 255)
    v198.TextSize = 14
    v198.Text = p197:lower()
    v198.TextXAlignment = Enum.TextXAlignment.Center
    local v199 = vu118:GetTextSize(p197, v198.TextSize, v198.Font, Vector2.new(math.huge, 21))
    v198.Size = UDim2.new(0, v199.X + 12, 0, 21)
    local v200 = Instance.new("UICorner")
    v200.CornerRadius = UDim.new(0, 21)
    v200.Parent = v198
end
local function vu216()
    local v202 = vu59
    local v203, v204, v205 = ipairs(v202:GetChildren())
    while true do
        local v206
        v205, v206 = v203(v204, v205)
        if v205 == nil then
            break
        end
        if v206:IsA("TextLabel") then
            v206:Destroy()
        end
    end
    local v207, v208, v209 = ipairs(vu128)
    while true do
        local v210
        v209, v210 = v207(v208, v209)
        if v209 == nil then
            break
        end
        if v210.var == true then
            local v211 = (v210.button:GetAttribute("AlternateNames") or ""):split(",")
            local v212, v213, v214 = ipairs(v211)
            while true do
                local v215
                v214, v215 = v212(v213, v214)
                if v214 == nil then
                    break
                end
                if v215 ~= "" then
                    vu201(v215)
                end
            end
        end
    end
    vu59.Size = UDim2.new(vu59.Size.X.Scale, vu59.Size.X.Offset, 0, vu60.AbsoluteContentSize.Y)
end
local vu217 = v170(vu17("custom songs") .. " (0)", "utils")
vu217.MouseButton1Click:Connect(function()
    vu42.CanvasPosition = Vector2.new(0, 0)
    vu183()
    local v218, v219, v220 = ipairs(vu149)
    while true do
        local v221
        v220, v221 = v218(v219, v220)
        if v220 == nil then
            break
        end
        v221.buttonFrame.Visible = true
    end
    NEWSONGBUTTON.Visible = true
    vu152.Visible = true
end)
function updatecustomcount()
    vu217.Text = vu17("custom songs") .. " (" .. tostring(# vu149) .. ")"
end
local vu222 = v170(vu17("favourites"), "utils")
vu222.MouseButton1Click:Connect(function()
    vu42.CanvasPosition = Vector2.new(0, 0)
    vu183()
    local v223, v224, v225 = ipairs(vu151)
    while true do
        local v226
        v225, v226 = v223(v224, v225)
        if v225 == nil then
            break
        end
        v226.Visible = true
    end
    vu152.Visible = true
end)
function updatefavcount()
    vu222.Text = vu17("favourites") .. " (" .. tostring(# vu151) .. ")"
end
updatefavcount()
local function vu240()
    local v227, v228, v229 = ipairs(vu128)
    while true do
        local v230
        v229, v230 = v227(v228, v229)
        if v229 == nil then
            break
        end
        v230.button.LayoutOrder = v230.button:GetAttribute("OriginalLayoutOrder") or v230.button.LayoutOrder
    end
    local v231, v232, v233 = ipairs(vu149)
    while true do
        local v234
        v233, v234 = v231(v232, v233)
        if v233 == nil then
            break
        end
        v234.buttonFrame.LayoutOrder = v234.buttonFrame:GetAttribute("OriginalLayoutOrder") or v234.buttonFrame.LayoutOrder
    end
    local v235, v236, v237 = ipairs(vu150)
    while true do
        local v238
        v237, v238 = v235(v236, v237)
        if v237 == nil then
            break
        end
        local v239 = v238.button or v238.buttonFrame
        if v239 then
            v239.LayoutOrder = v237 + 3
        end
    end
end
local vu241 = {}
local function vu262(p242, _, pu243)
    local v244 = p242:IsA("Frame")
    local v245 = nil
    local v246
    if v244 then
        local v247 = p242:FindFirstChild("button")
        v245 = p242:FindFirstChild("ImageButton")
        if v245 then
            v245.Visible = false
        end
        if v247 then
            v247.Position = UDim2.new(0, 0, 0, 0)
            v247.Size = UDim2.new(0, 108, 1, 0)
            vu21(v247)
            v246 = p242
            p242 = v247
        else
            v246 = p242
            p242 = v247
        end
    else
        v246 = Instance.new("Frame")
        v246.Name = "playlistWrapper"
        v246.Parent = p242.Parent
        v246.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
        v246.BorderColor3 = Color3.fromRGB(64, 68, 90)
        v246.BorderSizePixel = 4
        v246.Size = UDim2.new(0, 175, 0, 35)
        v246.LayoutOrder = p242.LayoutOrder
        p242.Parent = v246
        p242.Position = UDim2.new(0, 0, 0, 0)
        p242.Size = UDim2.new(0, 145, 1, 0)
        p242.BorderSizePixel = 0
        task.wait()
        vu21(p242)
    end
    local v248
    if v244 and v245 then
        v248 = Instance.new("Frame")
        v248.Name = "deleteContainer"
        v248.Parent = v246
        v248.BackgroundTransparency = 1
        v248.Position = UDim2.new(0, 108, 0, 0)
        v248.Size = UDim2.new(0, 37, 1, 0)
        v245.Parent = v248
        v245.Position = UDim2.new(0, 5, 0.5, - 13.5)
        v245.Size = UDim2.new(0, 27, 0, 27)
    else
        v248 = nil
    end
    local v249 = Instance.new("Frame")
    v249.Name = "arrows"
    v249.Parent = v246
    v249.BackgroundTransparency = 1
    v249.Position = UDim2.new(0, v244 and 145 or 145, 0, 0)
    v249.Size = UDim2.new(0, 30, 1, 0)
    local v250 = Instance.new("TextButton")
    v250.Parent = v249
    v250.BackgroundColor3 = Color3.fromRGB(96, 102, 121)
    v250.BorderSizePixel = 0
    v250.Size = UDim2.new(1, 0, 0.5, - 2)
    v250.Position = UDim2.new(0, 0, 0, 0)
    v250.Text = "\239\191\189\239\191\189"
    v250.TextColor3 = Color3.fromRGB(255, 255, 255)
    v250.TextScaled = true
    v250.Font = Enum.Font.SourceSansBold
    local v251 = Instance.new("TextButton")
    v251.Parent = v249
    v251.BackgroundColor3 = Color3.fromRGB(96, 102, 121)
    v251.BorderSizePixel = 0
    v251.Size = UDim2.new(1, 0, 0.5, - 2)
    v251.Position = UDim2.new(0, 0, 0.5, 2)
    v251.Text = "\239\191\189\239\191\189"
    v251.TextColor3 = Color3.fromRGB(255, 255, 255)
    v251.TextScaled = true
    v251.Font = Enum.Font.SourceSansBold
    table.insert(vu241, {
        wrapper = v246,
        original = v244 and v246 and v246 or p242,
        isCustom = v244,
        deleteButton = v245,
        deleteBtnContainer = v248
    })
    v246.LayoutOrder = pu243 + 3
    v250.MouseButton1Click:Connect(function()
        if pu243 > 1 then
            local v252 = vu150
            local v253 = pu243
            local v254 = vu150
            local v255 = pu243 - 1
            local v256 = vu150[pu243 - 1]
            v254[v255] = vu150[pu243]
            v252[v253] = v256
            refreshPlaylistView()
        end
    end)
    v251.MouseButton1Click:Connect(function()
        if pu243 < # vu150 then
            local v257 = vu150
            local v258 = pu243
            local v259 = vu150
            local v260 = pu243 + 1
            local v261 = vu150[pu243 + 1]
            v259[v260] = vu150[pu243]
            v257[v258] = v261
            refreshPlaylistView()
        end
    end)
end
function removePlaylistArrows()
    local v263, v264, v265 = ipairs(vu241)
    while true do
        local v266
        v265, v266 = v263(v264, v265)
        if v265 == nil then
            break
        end
        if v266.wrapper and v266.wrapper.Parent then
            if v266.isCustom then
                local v267 = v266.wrapper:FindFirstChild("button")
                if v267 then
                    v267.Position = UDim2.new(0, 0, 0, 0)
                    v267.Size = UDim2.new(0, 135, 0, 35)
                    v267.TextSize = 27
                    vu21(v267)
                end
                if v266.deleteButton and v266.wrapper then
                    v266.deleteButton.Parent = v266.wrapper
                    v266.deleteButton.Position = UDim2.new(0.816999972, 0, 0.115000002, 0)
                    v266.deleteButton.Size = UDim2.new(0, 27, 0, 27)
                    v266.deleteButton.Visible = true
                end
                local v268 = v266.wrapper:FindFirstChild("arrows")
                if v268 then
                    v268:Destroy()
                end
                if v266.deleteBtnContainer then
                    v266.deleteBtnContainer:Destroy()
                end
            else
                v266.original.Parent = vu42
                v266.original.Size = UDim2.new(0, 175, 0, 35)
                v266.original.BorderSizePixel = 4
                v266.original.TextSize = 27
                vu21(v266.original)
                v266.wrapper:Destroy()
            end
        end
    end
    vu241 = {}
end
function refreshPlaylistView()
    removePlaylistArrows()
    vu183()
    vu240()
    local v269, v270, v271 = ipairs(vu150)
    while true do
        local v272
        v271, v272 = v269(v270, v271)
        if v271 == nil then
            break
        end
        local v273 = v272.button or v272.buttonFrame
        if v273 then
            v273.Visible = true
            vu262(v273, v272, v271)
        end
    end
    PLAYPLAYLISTBUTTON.Visible = true
    SHUFFLEPLAYLISTBUTTON.Visible = true
end
local vu274 = v170(vu17("playlist") .. " (0)", "utils")
local function vu275()
    vu274.Text = vu17("playlist") .. " (" .. tostring(# vu150) .. ")"
end
PLAYPLAYLISTBUTTON = v112(vu17("playplaylist"))
PLAYPLAYLISTBUTTON.LayoutOrder = 1
SHUFFLEPLAYLISTBUTTON = v112(vu17("shuffleplaylist"))
SHUFFLEPLAYLISTBUTTON.LayoutOrder = 1
SHUFFLEPLAYLISTBUTTON.MouseButton1Click:Connect(function()
    if playingall then
        return
    elseif # vu150 > 1 then
        playingall = true
        vu196("playlist")
        local vu276 = {}
        local function v278()
            if # vu276 >= # vu150 then
                vu276 = {}
            end
            repeat
                local v277 = math.random(1, # vu150)
            until not table.find(vu276, vu150[v277])
            table.insert(vu276, vu150[v277])
            return vu150[v277]
        end
        while wait(0.5) do
            local v279 = v278()
            if not playingall then
                return
            end
            disable()
            v279.var = true
            local v280
            if v279.button then
                v280 = v279.button.Text
            else
                v280 = v279.buttonFrame.button.Text
            end
            vu192()
            vu49.Text = v280
            vu50.Text = tostring(v279.bpm)
            vu216()
            playbuttonclicked()
        end
    else
        vu22:SendNotification("Error", vu17("playlisttooshort"), 5)
        vu117("7383525713", 0.5)
    end
end)
PLAYPLAYLISTBUTTON.MouseButton1Click:Connect(function()
    if playingall then
        return
    elseif # vu150 > 1 then
        playingall = true
        vu196("playlist")
        local vu281 = 1
        local function v283()
            if vu281 > # vu150 then
                vu281 = 1
            end
            local v282 = vu150[vu281]
            vu281 = vu281 + 1
            return v282
        end
        while wait(0.5) do
            local v284 = v283()
            if not playingall then
                return
            end
            disable()
            v284.var = true
            local v285
            if v284.button then
                v285 = v284.button.Text
            else
                v285 = v284.buttonFrame.button.Text
            end
            vu192()
            vu49.Text = v285
            vu50.Text = tostring(v284.bpm)
            vu216()
            playbuttonclicked()
        end
    else
        vu22:SendNotification("Error", vu17("playlisttooshort"), 5)
        vu117("7383525713", 0.5)
    end
end)
vu274.MouseButton1Click:Connect(function()
    vu42.CanvasPosition = Vector2.new(0, 0)
    refreshPlaylistView()
end)
vu58.MouseButton1Click:Connect(function()
    local v286, v287, v288 = ipairs(vu128)
    local v289 = nil
    local v290 = nil
    while true do
        local v291
        v288, v291 = v286(v287, v288)
        if v288 == nil then
            v291 = v289
            break
        end
        if v291.var == true then
            local v292 = table.find(vu150, v291)
            if v292 then
                v290 = v292
                v291 = v289
            else
                table.insert(vu150, v291)
            end
            break
        end
    end
    if not (v291 or v290) then
        local v293, v294, v295 = ipairs(vu149)
        while true do
            local v296
            v295, v296 = v293(v294, v295)
            if v295 == nil then
                break
            end
            if v296.var == true then
                local v297 = table.find(vu150, v296)
                if v297 then
                    v290 = v297
                else
                    table.insert(vu150, v296)
                end
                break
            end
        end
    end
    if v290 then
        table.remove(vu150, v290)
    end
    vu275()
    vu192()
    if PLAYPLAYLISTBUTTON.Visible then
        refreshPlaylistView()
    end
end)
v170(vu17("other"), "utils").MouseButton1Click:Connect(function()
    vu42.CanvasPosition = Vector2.new(0, 0)
    vu183()
    PLAYRANDOM.Visible = true
    LOOPRANDOM.Visible = true
end)
v170(vu17("all") .. " (" .. tostring(# vu128) .. ")", "cat").MouseButton1Click:Connect(function()
    vu42.CanvasPosition = Vector2.new(0, 0)
    vu183()
    local v298, v299, v300 = ipairs(vu128)
    while true do
        local v301
        v300, v301 = v298(v299, v300)
        if v300 == nil then
            break
        end
        v301.button.Visible = true
    end
    PLAYRANDOM.Visible = true
    LOOPRANDOM.Visible = true
end)
local v302, v303, v304 = pairs(v140)
local v305 = vu152
local vu306 = vu151
local vu307 = vu196
local vu308 = vu192
local vu309 = vu216
local vu310 = vu149
local vu311 = vu183
while true do
    local vu312
    v304, vu312 = v302(v303, v304)
    if v304 == nil then
        break
    end
    local v313, v314, v315 = ipairs(vu128)
    local v316 = {}
    while true do
        local v317
        v315, v317 = v313(v314, v315)
        if v315 == nil then
            break
        end
        local v318, v319, v320 = ipairs(v317.cat)
        while true do
            local v321
            v320, v321 = v318(v319, v320)
            if v320 == nil then
                break
            end
            if v321 == vu312 then
                table.insert(v316, v317.button.Name)
            end
        end
    end
    local v322 = v170(vu17(vu312) .. " (" .. tostring(# v316) .. ")", "cat")
    if getgenv().languages.ar then
        if vu312 ~= "creepy/weirdcore" then
            if vu312 == "anime/jpop" then
                v322.Text = "u{200E}" .. " (" .. tostring(# v316) .. ")\239\191\189\217\134\217\133\217\138/J-pop"
            end
        else
            v322.Text = "u{200E}" .. " (" .. tostring(# v316) .. ") \217\133\216\174\217\138\217\129/weirdcore"
        end
    end
    v322.MouseButton1Click:Connect(function()
        vu311()
        vu42.CanvasPosition = Vector2.new(0, 0)
        local v323, v324, v325 = ipairs(vu128)
        while true do
            local v326
            v325, v326 = v323(v324, v325)
            if v325 == nil then
                break
            end
            v326.button.Visible = false
            local v327, v328, v329 = ipairs(v326.cat)
            while true do
                local v330
                v329, v330 = v327(v328, v329)
                if v329 == nil then
                    break
                end
                if v330 == vu312 then
                    v326.button.Visible = true
                end
            end
        end
    end)
end
function disable()
    local v331, v332, v333 = ipairs(vu128)
    while true do
        local v334
        v333, v334 = v331(v332, v333)
        if v333 == nil then
            break
        end
        v334.var = false
    end
    local v335, v336, v337 = ipairs(vu310)
    while true do
        local v338
        v337, v338 = v335(v336, v337)
        if v337 == nil then
            break
        end
        v338.var = false
    end
end
disable()
songisplaying = false
function playbuttonclicked()
    if songisplaying then
        vu22:SendNotification("Error", vu17("songplayingerror"), 1)
        vu117("7383525713", 0.5)
        return
    else
        songisplaying = true
        bpm = tonumber(vu50.Text)
        if bpm == 0 then
            SendNotification("Error", vu17("invalidbpm"), 3)
            vu117("7383525713", 0.5)
        else
            local vu339 = false
            local vu340 = false
            task.spawn(function()
                local v341, v342, v343 = pairs(vu128)
                local v344 = false
                while true do
                    local v345
                    v343, v345 = v341(v342, v343)
                    if v343 == nil then
                        break
                    end
                    if v344 == false and v345.var == true then
                        vu340 = game:HttpGet("https://cdn.jsdelivr.net/gh/hellohellohell012321/TALENTLESS/SONGS/" .. v345.url, true)
                        v344 = true
                    end
                end
                if not v344 then
                    local v346, v347, v348 = ipairs(vu310)
                    while true do
                        local v349
                        v348, v349 = v346(v347, v348)
                        if v348 == nil then
                            break
                        end
                        if v349.var == true then
                            vu339 = true
                            songcode = readfile(v349.file)
                            if loadstring(songcode) then
                                print("script is good")
                                vu340 = songcode
                            else
                                print("invalid script")
                                vu22:SendNotification("Error", vu17("brokensongscript"), 5)
                                vu117("7383525713", 0.5)
                            end
                        end
                    end
                end
            end)
            if vu339 ~= true then
                if vu77 ~= true then
                    loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/hellohellohell012321/TALENTLESS/loader_main.lua", true))()
                else
                    loadstring(game:HttpGet("https://cdn.jsdelivr.net/gh/hellohellohell012321/TALENTLESS/midi_spoof_loader.lua", true))()
                end
            end
            repeat
                wait()
            until vu340
            loadstring(vu340)()
            repeat
                wait()
            until getgenv().STOPIT == true
        end
    end
end
v51.MouseButton1Click:Connect(playbuttonclicked)
local v350, v351, v352 = ipairs(vu128)
while true do
    local vu353
    v352, vu353 = v350(v351, v352)
    if v352 == nil then
        break
    end
    vu353.button.MouseButton1Click:Connect(function()
        disable()
        vu353.var = true
        vu49.Text = vu353.button.Text
        vu50.Text = vu353.bpm
        vu309()
        vu48.CanvasPosition = Vector2.new(0, 0)
        vu308()
    end)
end
PLAYRANDOM.MouseButton1Click:Connect(function()
    local v354 = (function()
        return vu128[math.random(1, # vu128)]
    end)()
    disable()
    v354.var = true
    vu49.Text = v354.button.Name
    vu50.Text = v354.bpm
    vu309()
    vu308()
    playbuttonclicked()
end)
playingall = false
LOOPRANDOM.MouseButton1Click:Connect(function()
    if not playingall then
        playingall = true
        vu307("looprandom")
        local vu355 = {}
        local function v357()
            if # vu355 >= # vu128 then
                vu355 = {}
            end
            repeat
                local v356 = math.random(1, # vu128)
            until not table.find(vu355, vu128[v356].button.Name)
            table.insert(vu355, vu128[v356].button.Name)
            return vu128[v356]
        end
        while wait(1) do
            local v358 = v357()
            if not playingall then
                return
            end
            disable()
            v358.var = true
            vu49.Text = v358.button.Name
            vu50.Text = v358.bpm
            vu309()
            vu308()
            playbuttonclicked()
        end
    end
end)
vu42.CanvasPosition = Vector2.new(0, 0)
vu311()
local v359, v360, v361 = ipairs(vu128)
while true do
    local v362
    v361, v362 = v359(v360, v361)
    if v361 == nil then
        break
    end
    v362.button.Visible = true
end
PLAYRANDOM.Visible = true
LOOPRANDOM.Visible = true
local function vu367(p363, _, p364)
    print("Running test: " .. p363)
    local v365, v366 = pcall(p364)
    if v365 then
        print(p363 .. " passed")
        return true
    else
        print(p363 .. " failed: " .. v366)
        return false
    end
end
if (function()
    local v368 = vu367("makefolder", {}, function()
        makefolder("TALENTLESS_makefolder")
        assert(isfolder("TALENTLESS_makefolder"), "Did not create the folder")
    end)
    local v369 = v368 and true or v368
    local v370 = vu367("listfiles", {}, function()
        assert(# listfiles("") > 0, "Did not return a list of files")
    end)
    if not v370 then
        v369 = v370
    end
    local v371 = vu367("writefile", {}, function()
        writefile("TALENTLESS_makefolder/writefile.txt", "success")
        testfile = listfiles("./TALENTLESS_makefolder")[1]
        assert(readfile(testfile) == "success", "Did not write the file")
    end)
    if v371 then
        v371 = v369
    end
    local v372 = vu367("listfiles2", {}, function()
        assert(# listfiles("./TALENTLESS_makefolder") > 0, "Did not return a list of files")
    end)
    if v372 then
        v372 = v371
    end
    local v373 = vu367("delfile", {}, function()
        delfile(testfile)
        assert(not isfile(testfile), "Did not delete the file")
    end)
    if v373 then
        v373 = v372
    end
    return v373
end)() == true then
    print("this executor supports custom songs")
    v305:Destroy()
end
local function vu379(p374)
    local v375 = Instance.new("Frame")
    local v376 = Instance.new("TextButton")
    local v377 = Instance.new("ImageButton")
    v375.Name = "customsongframe"
    v375.Parent = vu42
    v375.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
    v375.BorderColor3 = Color3.fromRGB(64, 68, 90)
    v375.BorderSizePixel = 4
    v375.Size = UDim2.new(0, 175, 0, 35)
    v375.SizeConstraint = Enum.SizeConstraint.RelativeYY
    v375.LayoutOrder = # vu119 + 1
    v375.Visible = false
    v375:SetAttribute("OriginalLayoutOrder", # vu119 + 1)
    v376.Name = "button"
    v376.Parent = v375
    v376.BackgroundTransparency = 1
    v376.Size = UDim2.new(0, 135, 0, 35)
    v376.Font = Enum.Font.SourceSansBold
    v376.Text = p374
    v376.TextColor3 = Color3.fromRGB(255, 255, 255)
    v376.TextSize = 27
    v376.TextWrapped = true
    vu21(v376)
    v377.Parent = v375
    v377.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v377.BackgroundTransparency = 1
    v377.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v377.BorderSizePixel = 0
    v377.Position = UDim2.new(0.816999972, 0, 0.115000002, 0)
    v377.Size = UDim2.new(0, 27, 0, 27)
    v377.Image = "http://www.roblox.com/asset/?id=6121397347"
    local v378 = Instance.new("ImageButton")
    v378.Parent = v376
    v378.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v378.BackgroundTransparency = 1
    v378.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v378.BorderSizePixel = 0
    v378.AnchorPoint = Vector2.new(0, 0.5)
    v378.Position = UDim2.new(0, 0, 0.5, 0)
    v378.Size = UDim2.new(0, 25, 0, 25)
    v378.Image = vu23
    v378.Visible = false
    v378.Name = "favButton"
    return {
        button = v376,
        delbutton = v377,
        frame = v375
    }
end
NEWSONGBUTTON = v112("+", {})
NEWSONGBUTTON.TextSize = 30
NEWSONGBUTTON.Visible = false
print("loaded NEWSONGBUTTON")
NEWSONGBUTTON.MouseButton1Click:Connect(function()
    loadstring([=[

local NotificationLibrary = getgenv().notiflib
local function playSound(soundId, loudness)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = game.Players.LocalPlayer.Character or game.Players.LocalPlayer
    sound.Volume = loudness or 1  -- Default to full volume if no loudness is provided
    sound:Play()
end

local translator = getgenv().translator

local function translateText(text)
    return translator:translateText(text)
end

local addgui = Instance.new("ScreenGui")
local newsongframe = Instance.new("Frame")
local insertscript = Instance.new("TextBox")
local newsonglabel = Instance.new("TextLabel")
local cancelButton = Instance.new("TextButton")
local insertsongName = Instance.new("TextBox")
local submitSong = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")

--Properties:

addgui.Name = "addgui"
addgui.Parent = game:GetService("CoreGui")
addgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

newsongframe.Name = "newsongframe"
newsongframe.Parent = addgui
newsongframe.AnchorPoint = Vector2.new(0.5, 0.5)
newsongframe.BackgroundColor3 = Color3.fromRGB(33, 33, 41)
newsongframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
newsongframe.BorderSizePixel = 0
newsongframe.Position = UDim2.new(0.5, 0, 0.5, 0)
newsongframe.Size = UDim2.new(0, 254, 0, 326)

insertscript.Name = "insertscript"
insertscript.Parent = newsongframe
insertscript.BackgroundColor3 = Color3.fromRGB(96, 102, 121)
insertscript.BorderColor3 = Color3.fromRGB(76, 82, 101)
insertscript.BorderSizePixel = 4
insertscript.LayoutOrder = 2
insertscript.Position = UDim2.new(0.0708699971, 0, 0.257669985, 0)
insertscript.Size = UDim2.new(0, 218, 0, 123)
insertscript.Font = Enum.Font.SourceSans
insertscript.PlaceholderText = translateText("custom song instructions")
insertscript.Text = ""
insertscript.TextColor3 = Color3.fromRGB(255, 255, 255)
insertscript.TextSize = 14.000
insertscript.TextWrapped = true

newsonglabel.Name = "newsonglabel"
newsonglabel.Parent = newsongframe
newsonglabel.BackgroundColor3 = Color3.fromRGB(76, 82, 101)
newsonglabel.BorderColor3 = Color3.fromRGB(64, 68, 90)
newsonglabel.BorderSizePixel = 4
newsonglabel.LayoutOrder = 1
newsonglabel.Position = UDim2.new(0.0708699971, 0, 0.0552100018, 0)
newsonglabel.Size = UDim2.new(0, 218, 0, 50)
newsonglabel.Font = Enum.Font.SourceSansBold
newsonglabel.Text = translateText("insert song script")
newsonglabel.TextColor3 = Color3.fromRGB(255, 255, 255)
newsonglabel.TextScaled = true
newsonglabel.TextWrapped = true

cancelButton.Name = "cancelButton"
cancelButton.Parent = newsonglabel
cancelButton.AnchorPoint = Vector2.new(1, 0)
cancelButton.BackgroundColor3 = Color3.fromRGB(170, 85, 85)
cancelButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.Position = UDim2.new(1.10091746, 10, -0.400000006, -10)
cancelButton.Size = UDim2.new(0, 40, 0, 40)
cancelButton.Font = Enum.Font.SourceSansBold
cancelButton.Text = "X"
cancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
cancelButton.TextSize = 45.000

insertsongName.Name = "insertsongName"
insertsongName.Parent = newsongframe
insertsongName.BackgroundColor3 = Color3.fromRGB(96, 102, 121)
insertsongName.BorderColor3 = Color3.fromRGB(64, 68, 90)
insertsongName.BorderSizePixel = 4
insertsongName.LayoutOrder = 3
insertsongName.Position = UDim2.new(0.0708699971, 0, 0.69325, 0)
insertsongName.Size = UDim2.new(0, 218, 0, 32)
insertsongName.Font = Enum.Font.SourceSans
insertsongName.PlaceholderText = translateText("song name prompt")
insertsongName.Text = ""
insertsongName.TextColor3 = Color3.fromRGB(255, 255, 255)
insertsongName.TextSize = 20
insertsongName.TextWrapped = true

submitSong.Name = "submitSong"
submitSong.Parent = newsongframe
submitSong.BackgroundColor3 = Color3.fromRGB(85, 170, 85)
submitSong.BorderColor3 = Color3.fromRGB(0, 0, 0)
submitSong.BorderSizePixel = 0
submitSong.LayoutOrder = 4
submitSong.Position = UDim2.new(0.0708699971, 0, 0.834360003, 0)
submitSong.Size = UDim2.new(0, 218, 0, 41)
submitSong.Font = Enum.Font.SourceSansBold
submitSong.Text = translateText("submit")
submitSong.TextColor3 = Color3.fromRGB(255, 255, 255)
submitSong.TextSize = 43.000

UIListLayout.Parent = newsongframe
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Padding = UDim.new(0, 15)

-- drag script (not mince)



local UserInputService = game:GetService("UserInputService")

local gui = newsongframe

local dragging
local dragInput
local dragStart
local startPos
	
local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position
	
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
	
gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)
	
UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
end
end)



-- Function for the cancel button (closes the popup)
cancelButton.MouseButton1Click:Connect(function()
    newsongframe.Visible = false
end)


-- Function for the submit button (gets the script and song name)
submitSong.MouseButton1Click:Connect(function()
    local scriptInput = insertscript.Text
    local songName = insertsongName.Text
    
    local folderExists = false
    
for _, file in ipairs(listfiles("")) do
    if string.match(tostring(file), "TALENTLESS_CUSTOM_SONGS") then folderExists = true
    end
end

if not folderExists then
    print("making custom songs folder")
    makefolder("TALENTLESS_CUSTOM_SONGS")
    print("created custom song folder")
end

songexists = false

for _, file in ipairs(listfiles([[./TALENTLESS_CUSTOM_SONGS]])) do
    print(tostring(file))
	if string.find(tostring(file), songName .. ".txt") then -- if there is already a file with songname.txt in it then
        playSound("6493287948", 0.1) 
        NotificationLibrary:SendNotification("Error", translateText("songnameexists"), 3)
        songexists = true -- song does exist
        print("found a song file with the same name.")
        break
    end
end

if not songexists then
    writefile("TALENTLESS_CUSTOM_SONGS/" .. songName .. ".txt", scriptInput) -- write the file in the song folder as a .txt
    playSound("6493287948", 0.1) 
    NotificationLibrary:SendNotification("Success", string.format(translateText("songadded"), songName), 10)
    insertscript.Text = ""
    insertsongName.Text = ""
end

wait(0.5)

updateSongs()
end)
]=])()
end)
local vu380 = {}
function updateSongs()
    local v381, v382, v383 = ipairs(listfiles(""))
    while true do
        local v384
        v383, v384 = v381(v382, v383)
        if v383 == nil then
            break
        end
        print(tostring(v384))
        if vu148 == false and string.find(tostring(v384), "TALENTLESS_CUSTOM_SONGS") then
            vu148 = true
            print("custom songs folder found")
        end
    end
    print("searching for custom song files...")
    if vu148 then
        local v385, v386, v387 = ipairs(listfiles("./TALENTLESS_CUSTOM_SONGS"))
        while true do
            local v388
            v387, v388 = v385(v386, v387)
            if v387 == nil then
                break
            end
            print("song file found: " .. tostring(v388))
            local vu389 = tostring(v388)
            if table.find(vu380, vu389) then
                print("its not a txt, skipping")
            elseif vu389:match("%.txt$") then
                print("its a txt file, continuing")
                table.insert(vu380, vu389)
                local vu390 = vu389:gsub("\\", "/"):match(".*/([^/]+)%.txt$") or "Error"
                print("song name: " .. vu390)
                local v391 = vu379(vu390)
                local v392 = v391.button
                local v393 = v391.delbutton
                local vu394 = v391.frame
                local vu395 = readfile(v388):match("bpm%s*=%s*(%d+)") or "error"
                print("songbpm found: " .. vu395)
                local v396 = {
                    buttonFrame = vu394,
                    bpm = vu395,
                    var = false,
                    file = v388
                }
                table.insert(vu310, v396)
                vu394.Visible = false
                print("created song button for " .. vu390)
                v392.MouseButton1Click:Connect(function()
                    print("clicked!")
                    disable()
                    local v397, v398, v399 = ipairs(vu310)
                    while true do
                        local v400
                        v399, v400 = v397(v398, v399)
                        if v399 == nil then
                            break
                        end
                        if v400.buttonFrame == vu394 then
                            v400.var = true
                        end
                    end
                    vu308()
                    vu49.Text = vu390
                    vu50.Text = vu395
                end)
                local vu401 = 0.5
                local vu402 = 0
                v393.MouseButton1Click:Connect(function()
                    local v403 = tick()
                    if v403 - vu402 > vu401 then
                        print("Single-click detected. Showing notification...")
                        vu117("18595195017", 0.5)
                        vu22:SendNotification("Info", vu17("doubleclickdelete"), 3)
                    else
                        print("double-click detected. deleting song...")
                        delfile(vu389)
                        vu394:Destroy()
                        local v404, v405, v406 = ipairs(vu310)
                        while true do
                            local v407
                            v406, v407 = v404(v405, v406)
                            if v406 == nil then
                                break
                            end
                            if v407.buttonFrame == vu394 then
                                vu310[table.find(vu310, v407)] = nil
                                break
                            end
                        end
                        table.remove(vu380, table.find(vu380, vu389))
                        updatecustomcount()
                        vu117("18595195017", 0.5)
                        vu22:SendNotification("Success", vu17("songdeleted"), 5)
                    end
                    vu402 = v403
                end)
                updatecustomcount()
            else
                print("song already added, skipping")
            end
        end
    end
end
local v408, v409, v410 = ipairs(vu42:GetChildren())
while true do
    local v411, v412 = v408(v409, v410)
    if v411 == nil then
        break
    end
    v410 = v411
    if v412:IsA("TextButton") and v412.Text == "error" then
        v412:Destroy()
    end
end
wait(0.5)
updateSongs()
local vu413 = {}
local function vu434()
    local v414, v415
    if isfile("TALENTLESS_FAV_SONGS.txt") then
        v414 = readfile("TALENTLESS_FAV_SONGS.txt")
        v415 = true
    else
        v415 = false
        v414 = nil
    end
    if v415 then
        local v416, v417, v418 = ipairs(vu128)
        local v419 = {}
        while true do
            local v420
            v418, v420 = v416(v417, v418)
            if v418 == nil then
                break
            end
            table.insert(v419, {
                button = v420.button,
                name = v420.button.Text
            })
        end
        local v421, v422, v423 = ipairs(vu310)
        while true do
            local v424
            v423, v424 = v421(v422, v423)
            if v423 == nil then
                break
            end
            local v425 = v424.buttonFrame
            if v425 then
                v425 = v424.buttonFrame:FindFirstChildOfClass("TextButton")
            end
            if v425 then
                table.insert(v419, {
                    button = v424.buttonFrame,
                    name = v425.Text
                })
            end
        end
        local v426, v427, v428 = v414:gmatch("[^\r\n]+")
        while true do
            local v429 = v426(v427, v428)
            if v429 == nil then
                break
            end
            if v429 == "" or table.find(vu413, v429) then
                v428 = v429
            else
                local v430, v431, v432 = ipairs(v419)
                v428 = v429
                while true do
                    local v433
                    v432, v433 = v430(v431, v432)
                    if v432 == nil then
                        break
                    end
                    if v433.name == v429 then
                        table.insert(vu306, v433.button)
                    end
                end
                table.insert(vu413, v429)
            end
        end
    end
    updatefavcount()
end
local function vu441(p435)
    if not isfile("TALENTLESS_FAV_SONGS.txt") then
        writefile("TALENTLESS_FAV_SONGS.txt", "")
    end
    local v436 = readfile("TALENTLESS_FAV_SONGS.txt")
    local v437, v438, v439 = v436:gmatch("[^\r\n]+")
    local v440 = false
    while true do
        v439 = v437(v438, v439)
        if v439 == nil then
            break
        end
        if v439 == p435 then
            v440 = true
            break
        end
    end
    if not v440 then
        writefile("TALENTLESS_FAV_SONGS.txt", v436 .. "\n" .. p435)
    end
    vu434()
end
wait(0.5)
vu434()
local function vu455(p442)
    if not isfile("TALENTLESS_FAV_SONGS.txt") then
        return
    end
    local v443, v444, v445 = readfile("TALENTLESS_FAV_SONGS.txt"):gmatch("[^\r\n]+")
    local v446 = {}
    while true do
        v445 = v443(v444, v445)
        if v445 == nil then
            break
        end
        if v445 ~= "" and v445 ~= p442 then
            table.insert(v446, v445)
        end
    end
    writefile("TALENTLESS_FAV_SONGS.txt", table.concat(v446, "\n"))
    local v447, v448, v449 = ipairs(vu413)
    while true do
        local v450
        v449, v450 = v447(v448, v449)
        if v449 == nil then
            break
        end
        if v450 == p442 then
            table.remove(vu413, v449)
            break
        end
    end
    local v451, v452, v453 = ipairs(vu306)
    while true do
        local v454
        v453, v454 = v451(v452, v453)
        if v453 == nil then
            break
        end
        if v454:IsA("Frame") then
            if v454 then
                v454 = v454:FindFirstChildOfClass("TextButton")
            end
            if v454 and v454.Text == p442 then
                table.remove(vu306, v453)
                break
            end
        elseif v454.Text == p442 then
            table.remove(vu306, v453)
            break
        end
    end
    vu308()
    vu434()
end
vu57.MouseButton1Click:Connect(function()
    local v456, v457, v458 = ipairs(vu128)
    while true do
        local v459
        v458, v459 = v456(v457, v458)
        if v458 == nil then
            break
        end
        if v459.var == true then
            if table.find(vu306, v459.button) then
                vu455(v459.button.Text)
                vu434()
            else
                vu441(v459.button.Text)
                vu434()
            end
        end
    end
    local v460, v461, v462 = ipairs(vu310)
    while true do
        local v463
        v462, v463 = v460(v461, v462)
        if v462 == nil then
            break
        end
        if v463.var == true then
            if table.find(vu306, v463.buttonFrame) then
                vu455(v463.buttonFrame.button.Text)
                vu434()
            else
                vu441(v463.buttonFrame.button.Text)
                vu434()
            end
        end
    end
    vu308()
end)
