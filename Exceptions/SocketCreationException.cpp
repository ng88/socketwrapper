//
// Created by timog on 22.12.18.
//

#include "SocketCreationException.hpp"

namespace socketwrapper
{

const char* SocketCreationException::what() const
{
    return "Error creation Socket";
}

}
