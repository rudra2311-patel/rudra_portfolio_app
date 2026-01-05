/**
 * Component Loader for PhytoLens Landing Page
 * Loads HTML components dynamically
 */

// Component configuration - maps placeholder IDs to component files
const components = {
    'navbar-placeholder': 'components/navbar.html',
    'hero-placeholder': 'components/hero.html',
    'footer-placeholder': 'components/footer.html'
};

/**
 * Load a single component from file
 * @param {string} placeholder - ID of the placeholder element
 * @param {string} filePath - Path to the component HTML file
 */
async function loadComponent(placeholder, filePath) {
    try {
        const response = await fetch(filePath);
        if (!response.ok) {
            throw new Error(`Failed to load ${filePath}: ${response.statusText}`);
        }
        
        const html = await response.text();
        const element = document.getElementById(placeholder);
        
        if (element) {
            element.outerHTML = html;
            console.log(`✅ Loaded: ${filePath}`);
        } else {
            console.warn(`⚠️  Placeholder not found: #${placeholder}`);
        }
    } catch (error) {
        console.error(`❌ Error loading ${filePath}:`, error);
    }
}

/**
 * Load all components on page load
 */
async function loadAllComponents() {
    console.log('🚀 Loading components...');
    
    const loadPromises = Object.entries(components).map(([placeholder, filePath]) => 
        loadComponent(placeholder, filePath)
    );
    
    await Promise.all(loadPromises);
    console.log('✨ All components loaded!');
}

// Load components when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadAllComponents);
} else {
    loadAllComponents();
}
