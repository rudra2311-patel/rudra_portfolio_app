/**
 * Image Gallery Modal Lightbox
 * Professional image viewer with navigation
 */

class ImageGallery {
    constructor() {
        this.images = [];
        this.currentIndex = 0;
        this.modal = null;
        this.init();
    }

    init() {
        // Create modal structure
        this.createModal();
        
        // Bind gallery items
        this.bindGalleryItems();
        
        // Bind keyboard navigation
        this.bindKeyboard();
    }

    createModal() {
        const modalHTML = `
            <div class="modal-lightbox" id="imageLightbox">
                <div class="modal-close" onclick="imageGallery.close()"></div>
                
                <div class="modal-nav prev" onclick="imageGallery.prev()">
                    <svg viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/></svg>
                </div>
                
                <div class="modal-content">
                    <img class="modal-image" id="modalImage" src="" alt="">
                    <div class="modal-title" id="modalTitle"></div>
                </div>
                
                <div class="modal-nav next" onclick="imageGallery.next()">
                    <svg viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/></svg>
                </div>
                
                <div class="image-counter" id="imageCounter">1 / 1</div>
            </div>
        `;
        
        document.body.insertAdjacentHTML('beforeend', modalHTML);
        this.modal = document.getElementById('imageLightbox');
    }

    bindGalleryItems() {
        const galleryItems = document.querySelectorAll('.gallery-item');
        
        galleryItems.forEach((item, index) => {
            const img = item.querySelector('img');
            const title = item.dataset.title || 'Architecture Diagram';
            
            this.images.push({
                src: img.src,
                alt: img.alt,
                title: title
            });
            
            item.addEventListener('click', () => {
                this.open(index);
            });
        });
    }

    open(index) {
        this.currentIndex = index;
        this.updateModal();
        this.modal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    close() {
        this.modal.classList.remove('active');
        document.body.style.overflow = '';
    }

    next() {
        this.currentIndex = (this.currentIndex + 1) % this.images.length;
        this.updateModal();
    }

    prev() {
        this.currentIndex = (this.currentIndex - 1 + this.images.length) % this.images.length;
        this.updateModal();
    }

    updateModal() {
        const current = this.images[this.currentIndex];
        
        document.getElementById('modalImage').src = current.src;
        document.getElementById('modalImage').alt = current.alt;
        document.getElementById('modalTitle').textContent = current.title;
        document.getElementById('imageCounter').textContent = 
            `${this.currentIndex + 1} / ${this.images.length}`;
    }

    bindKeyboard() {
        document.addEventListener('keydown', (e) => {
            if (!this.modal.classList.contains('active')) return;
            
            switch(e.key) {
                case 'Escape':
                    this.close();
                    break;
                case 'ArrowLeft':
                    this.prev();
                    break;
                case 'ArrowRight':
                    this.next();
                    break;
            }
        });
        
        // Close on background click
        this.modal.addEventListener('click', (e) => {
            if (e.target === this.modal) {
                this.close();
            }
        });
    }
}

// Initialize gallery when DOM is ready
let imageGallery;

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        imageGallery = new ImageGallery();
    });
} else {
    imageGallery = new ImageGallery();
}
