// 礼物数据
const gifts = [
    {
        id: 1,
        title: '生日蛋糕',
        icon: '🎂',
        image: 'https://neeko-copilot.bytedance.net/api/text2image?prompt=birthday%20cake%20with%20candles%20and%20decorations&size=800x600',
        description: '为你准备了一个美味的生日蛋糕，上面有你喜欢的巧克力和水果，希望你喜欢！'
    },
    {
        id: 2,
        title: 'Lululemon瑜伽裤',
        icon: '🧘‍♀️',
        image: 'https://neeko-copilot.bytedance.net/api/text2image?prompt=lululemon%20yoga%20pants%20in%20pink%20color&size=800x600',
        description: '舒适的Lululemon瑜伽裤，让你在运动时更加自信和舒适。'
    },
    {
        id: 3,
        title: '防晒口罩',
        icon: '😷',
        image: 'https://neeko-copilot.bytedance.net/api/text2image?prompt=sunscreen%20mask%20with%20uv%20protection&size=800x600',
        description: '夏季必备的防晒口罩，有效阻挡紫外线，让你在户外活动时更加安心。'
    },
    {
        id: 4,
        title: '高跟鞋',
        icon: '👠',
        image: 'https://neeko-copilot.bytedance.net/api/text2image?prompt=high%20heels%20shoes%20in%20pink%20color&size=800x600',
        description: '一双漂亮的高跟鞋，让你在重要场合更加优雅动人。'
    },
    {
        id: 5,
        title: '生日视频',
        icon: '🎥',
        image: 'https://neeko-copilot.bytedance.net/api/text2image?prompt=birthday%20video%20montage%20with%20photos&size=800x600',
        description: '为你制作了一段温馨的生日视频，记录了我们一起的美好时光。'
    }
];

// 生成卡片
function generateCards() {
    const cardsContainer = document.querySelector('.cards-container');
    
    gifts.forEach(gift => {
        const card = document.createElement('div');
        card.className = 'card';
        card.innerHTML = `
            <div class="card-content">
                <div class="card-icon">${gift.icon}</div>
                <div class="card-title">${gift.title}</div>
            </div>
            <div class="scratch-layer"></div>
        `;
        
        cardsContainer.appendChild(card);
        
        // 添加刮刮乐效果
        addScratchEffect(card, gift);
    });
}

// 刮刮乐效果
function addScratchEffect(card, gift) {
    const scratchLayer = card.querySelector('.scratch-layer');
    let isScratching = false;
    
    scratchLayer.addEventListener('mousedown', startScratching);
    scratchLayer.addEventListener('touchstart', startScratching);
    
    document.addEventListener('mousemove', scratch);
    document.addEventListener('touchmove', scratch);
    
    document.addEventListener('mouseup', stopScratching);
    document.addEventListener('touchend', stopScratching);
    
    function startScratching(e) {
        isScratching = true;
    }
    
    function scratch(e) {
        if (!isScratching) return;
        
        const rect = scratchLayer.getBoundingClientRect();
        let x, y;
        
        if (e.type === 'mousemove') {
            x = e.clientX - rect.left;
            y = e.clientY - rect.top;
        } else if (e.type === 'touchmove') {
            x = e.touches[0].clientX - rect.left;
            y = e.touches[0].clientY - rect.top;
        }
        
        // 创建刮开效果
        const scratchArea = document.createElement('div');
        scratchArea.style.position = 'absolute';
        scratchArea.style.width = '50px';
        scratchArea.style.height = '50px';
        scratchArea.style.borderRadius = '50%';
        scratchArea.style.background = 'transparent';
        scratchArea.style.left = (x - 25) + 'px';
        scratchArea.style.top = (y - 25) + 'px';
        scratchArea.style.zIndex = '3';
        scratchArea.style.backdropFilter = 'blur(5px)';
        
        scratchLayer.appendChild(scratchArea);
        
        // 检查是否刮开了大部分
        if (scratchLayer.children.length > 10) {
            scratchLayer.style.opacity = '0';
            setTimeout(() => {
                scratchLayer.style.display = 'none';
            }, 500);
        }
    }
    
    function stopScratching() {
        isScratching = false;
    }
    
    // 卡片点击事件
    card.addEventListener('click', () => {
        if (scratchLayer.style.display === 'none') {
            showGiftDetail(gift);
        }
    });
}

// 显示礼物详情
function showGiftDetail(gift) {
    const detailModal = document.getElementById('gift-detail');
    const detailTitle = document.getElementById('detail-title');
    const detailImage = document.getElementById('detail-image');
    const detailDescription = document.getElementById('detail-description');
    
    detailTitle.textContent = gift.title;
    detailImage.style.backgroundImage = `url(${gift.image})`;
    detailDescription.textContent = gift.description;
    
    detailModal.classList.add('active');
}

// 关闭详情页
function closeGiftDetail() {
    const detailModal = document.getElementById('gift-detail');
    detailModal.classList.remove('active');
}

// 初始化
function init() {
    generateCards();
    
    // 关闭按钮事件
    document.querySelector('.close-btn').addEventListener('click', closeGiftDetail);
    
    // 点击模态框外部关闭
    document.getElementById('gift-detail').addEventListener('click', (e) => {
        if (e.target === document.getElementById('gift-detail')) {
            closeGiftDetail();
        }
    });
}

// 页面加载完成后初始化
window.addEventListener('DOMContentLoaded', init);