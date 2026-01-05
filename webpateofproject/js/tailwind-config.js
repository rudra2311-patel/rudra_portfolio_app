/* ===================================
   Tailwind Configuration
   PhytoLens Engineering Landing Page
   =================================== */

tailwind.config = {
    theme: {
        extend: {
            fontFamily: {
                sans: ['Inter', 'sans-serif'],
                mono: ['JetBrains Mono', 'monospace'],
            },
            colors: {
                brand: {
                    green: '#10B981',
                    blue: '#0EA5E9',
                    dark: '#050505',
                    card: '#0A0A0A',
                    border: '#262626'
                }
            },
            backgroundImage: {
                'glow': 'conic-gradient(from 180deg at 50% 50%, #10B981 0deg, #0EA5E9 180deg, #10B981 360deg)',
            }
        }
    }
}
