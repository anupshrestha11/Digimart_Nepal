$('.portfolios').owlCarousel({
    loop:true,
    margin:10,
    dots:true,
    nav:true,
    autoplayHoverPause: true,
    autoplay: true,
    responsive:{
        0:{
            items:1,
            // dots:false,
            nav:false
        },
        800:{
            items:2,
            nav:false

        },
        1080:{
            items:3
        }
    }
})
$('.testimonials').owlCarousel({
    // loop:true,
    margin:10,
    dots:true,
    nav:true,
    autoplayHoverPause: true,
    autoplay: true,
    responsive:{
        0:{
            items:1,
            // dots:false,
            nav:false
        },
        600:{
            items:2,
            nav:false
        },
        1000:{
            items:2
        }
    }
})
