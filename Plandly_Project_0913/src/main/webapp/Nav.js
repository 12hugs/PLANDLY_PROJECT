/**
 * 
 */
let observer;
        let lastContentElement;

        function createObserver() {
            let options = {
                root: null,
                rootMargin: "0px",
                threshold: 1.0
            };

            observer = new IntersectionObserver(handleIntersect, options);
            if (lastContentElement) observer.observe(lastContentElement);
        }

        let loadCount = 0;  // 현재까지 loadMoreData() 함수가 호출된 횟수
        const loadLimit = 20;    // 최대로 loadMoreData() 함수를 호출할 횟수

        function handleIntersect(entries, observer) {
            entries.forEach((entry) => {
                if (entry.isIntersecting && loadCount < loadLimit) {
                    // 여기서 새로운 데이터를 로드합니다.
                    loadMoreData();
                    // 마지막 요소가 변경되면 관찰 대상도 변경해야 합니다.
                    if (lastContentElement) observer.unobserve(lastContentElement);
                    const contentElements = document.querySelectorAll('.content1_pack');
                    lastContentElement = contentElements[contentElements.length - 1];
                    observer.observe(lastContentElement);
                }
            });
        }

        function loadMoreData() {
            if (loadCount >= loadLimit) {
                return;
            }
        }
        function loadMoreData() {
            if (loadCount >= loadLimit) {
                return;
            }

            // 한 번에 12개의 요소 추가
            for (let i = 0; i < 12; i++) {
                const newPack = document.createElement('div');
                newPack.classList.add('content1_pack');

                // 데이터를 불러와서 새로운 요소에 추가합니다.
                const data = fetchData(); // 데이터를 불러오는 함수(fetchData()는 가상의 함수입니다.)

                newPack.innerHTML = `
            <div class="card-grid">
                <article class="card">
                    <div class="card-header">
                        <div>
                            <span><img src="${data.image}" /></span>
                            <h3>${data.title}</h3>
                        </div>
                    </div>
                    <div class="todo">${data.todo}</div>
                    <div class="card-body">
                        <p>${data.description}</p>
                    </div>
                    <div class="tag">
                        ${generateTags(data.tags)}
                    </div>
                </article>
            </div>`;

                document.querySelector('#content').appendChild(newPack);
            }

            loadCount++;   // 아이템을 추가로 로드했다는 것을 표시
        }

        // 가상의 데이터를 가져오는 함수
        function fetchData() {
            // 데이터를 가져오는 로직 작성...
            return {
                image: "path/to/image.jpg",
                title: "제목",
                todo: "할 일",
                description: "설명",
                tags: ["tag1", "tag2", "tag3"]
            };
        }

        // 태그 목록을 생성하는 함수
        function generateTags(tags) {
            return tags.map(tag => `<a href="#">${tag}</a>`).join('');
        }
        window.onload = function () {
            const contentElements = document.querySelectorAll('.content1_pack');
            lastContentElement = contentElements[contentElements.length - 1];

            createObserver();
        }