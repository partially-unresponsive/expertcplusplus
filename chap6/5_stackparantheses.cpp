/* Title: Stack practice exercise
*  Written by: CutieSai
*  Taken from: expertcplusplus (pag 229)
* 
*  This short program should validate the parantheses from this short string `r`, to make sure there is an equal amount of opened and close parantheses. It does nothing more.
*  It also will not check the *logic* of the expression, like r2 = "(a + b) + (x * y --+/)" will pass
*/

#include <stack>
#include <iostream>
#include <string>
#include <vector>

int main() { 
	std::string r = "(a + b) + (((x * y) - (a / b)) / 4);";
	std::stack<char> st;
	
	// Testing set r_list (just for myself, really)
	std::string r2 = "3 * a + (x - y) * (1 / (4.5 * x^2));";
	std::string r3 = "e^(3x + \\Int_(-2)^(3y)xlog(x)dx) + 2 * c;";
	std::vector<std::string> r_list = {r, r2, r3};

	for (const auto& str : r_list) {
		for (const auto& ch : str) {
			switch (ch) {
				case '(':
					st.push('(');
					break;
				case ')':
					st.pop();
					break;
			}
		}
	}

	if (st.size() == 0) {
		std::cout << "Success: Parantheses match" << std::endl;
	} else {
		std::cout << "Failure: Uneven number of parantheses" << std::endl;
		std::cout << "Unclosed parantheses count: " << st.size() << std::endl;
	}
}
