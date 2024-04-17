// Include headers of other components from this project path
// relative to the "include" directory of the component, just like external projects
// would
#include <Sector/Core/Core.h>
// Include 3rd party headers
#include <gtest/gtest.h>
// Include system headers
#include <iostream>
#include <string>

// Test case names must start with the name of the executable they are
// contained in, in this case, "test_core"
TEST (test_core_Math, AnswerIsCorrect) {
    EXPECT_EQ(Sector::Core::get_the_answer(), 42U);
}

TEST (test_core_Math, MultiplyReturnsCorrectResults) {
    EXPECT_EQ(36, Sector::Core::multiply(6,6));
}
