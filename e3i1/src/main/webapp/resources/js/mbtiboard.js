
(function ($) {
	"use strict"; // Start of use strict

	var Popular = {
		init: function () {
			this.Basic.init();
		},

		Basic: {
			init: function () {

				this.ListSlider();

			},

			// list_slider
			ListSlider: function () {
				$('.account-slider').slick({
					dots: false,
					arrows: false,
					infinite: false,
					speed: 300,
					slidesToShow: 4.2,
					slidesToScroll: 4.2,
					responsive: [
					  {
						breakpoint: 1024,
						settings: {
						  slidesToShow: 4.5,
						  slidesToScroll: 4.5,
						}
					  },
					  {
						breakpoint: 680,
						settings: {
						  slidesToShow: 2.5,
						  slidesToScroll: 2.5
						}
					  },
					  {
						breakpoint: 520,
						settings: {
						  slidesToShow: 3.5,
						  slidesToScroll: 3.5
						}
					  },
					  {
						breakpoint: 422,
						settings: {
						  slidesToShow: 2.5,
						  slidesToScroll: 2.5
						}
					  }
					]
				  });
			},

			

		}
	}
	jQuery(document).ready(function () {
		Popular.init();
	});

})(jQuery); // End of use strict