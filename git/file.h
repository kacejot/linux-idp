#ifndef H_GEN_RANDOMIZER_INCLUDED
#define H_GEN_RANDOMIZER_INCLUDED

#include <type_traits>
#include <functional>
#include <string>
#include <random>

namespace gen
{
    template <typename T>
    class Randomizer
    {
    public:
        Randomizer(T left_border, T right_border, const std::string& seed = "");
        T operator()();

    private:
        std::function<T()> m_randomizer;
        T m_left_border;
        T m_right_border;
    };

    // Implementation

    template <typename T>
    T Randomizer<T>::operator()()
    {
        return m_randomizer();
    }

	auto get_default_random_engine(const std::string& seed = "")
	{
		std::seed_seq seed_sequence(seed.begin(), seed.end());
		return std::default_random_engine(seed_sequence);
	}
}

#endif//H_GEN_RANDOMIZER_INCLUDED
