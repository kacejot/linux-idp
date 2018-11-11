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
    Randomizer<T>::Randomizer(T left_border, T right_border, const std::string& seed) : m_left_border(left_border), m_right_border(right_border)
    {
        static_assert(std::is_floating_point_v<T>, "Type should be floating point");

        std::seed_seq seed_sequence(seed.begin(), seed.end());

        auto generator = std::default_random_engine(seed_sequence);
        auto distribution = std::uniform_real_distribution<T>(left_border, right_border);

        m_randomizer = std::bind(distribution, generator);
    }

    template <typename T>
    T Randomizer<T>::operator()()
    {
        return m_randomizer();
    }
}

#endif//H_GEN_RANDOMIZER_INCLUDED
