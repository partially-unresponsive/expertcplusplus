#include <boost/type_traits/has_trivial_assign.hpp>
#include <boost/type_traits/is_same.hpp>
#include <cstring>
#include <boost/type_traits.hpp>
namespace detail {
	// 1. Declare primary class template with a static function template
	template <bool b>
	struct copier {
		template<typename I1, typename I2>
		static I2 do_copy(I1 first, I1 last, I2 out);
	};
	
	// 2. Implementation of the static function template
	template <bool b>
	template <typename I1, typename I2>
	I2 copier<b>::do_copy(I1 first, I1 last, I2 out) {
		while(first != last) {
			*out = *first;
			++out;
			++first;
		}
	return out;
	}
	
	// 3. A full specialization of the primary function template
	template <>
	struct copier<true> {
		template<typename I1, typename I2>
		static I2* do_copy(I1* first, I1* last, I2* out){
			memcpy(out, first, (last-first)*sizeof(I2));
			// memcpy(void *__restrict dest, const void *__restrict src, size_t n) - memcpy() parameters
			return out+(last-first);
		}
	};
};  // end namespace detail

// copy() user interface
template <typename I1, typename I2>
inline I2 copy(I1 first, I1 last, I2 out) {
	typedef typename boost::remove_cv
	<typename std::iterator_traits<I1>::value_type>::type v1_t;

	typedef typename boost::remove_cv 
	<typename std::iterator_traits<I2>::value_type>::type v2_t;

	enum { can_opt = boost::is_same<v1_t, v2_t>::value
			&& boost::is_pointer<I1>::value
			&& boost::is_pointer<I2>::value
			&& boost::has_trivial_assign<v1_t>::value
	};

	// if can_opt = true, using memcpy() to copy whole block by one call (optimized);
	// otherwise, using assignment operator to do item-by-item copy
	return detail::copier<can_opt>::do_copy(first, last, out);
}


	
