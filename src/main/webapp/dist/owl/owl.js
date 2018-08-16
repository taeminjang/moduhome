/*** owl Carousel ***/
$.fn.owl = function(options) {
	this.owlCarousel.Constructor.Defaults = {
		items: 1,
		loop: true,
		center: false,

		mouseDrag: true,
		touchDrag: true,
		pullDrag: true,
		freeDrag: false,
		dots	: false,
		nav		: true,

		margin: 0,
		stagePadding: 0,

		merge: false,
		mergeFit: true,
		autoWidth: false,

		startPosition: 0,
		rtl: false,

		smartSpeed: 250,
		fluidSpeed: false,
		dragEndSpeed: false,

		responsive: {},
		responsiveRefreshRate: 200,
		responsiveBaseElement: window,
		responsiveClass: false,

		fallbackEasing: 'swing',

		info: false,

		nestedItemSelector: false,
		itemElement: 'div',
		stageElement: 'div',

		// Classes and Names
		themeClass: 'owl-theme',
		baseClass: 'owl-carousel',
		itemClass: 'owl-item',
		centerClass: 'center',
		activeClass: 'active',

		navText : ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
	};
	return this.owlCarousel(options);
};