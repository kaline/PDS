//filtro fir
float filter(flaot value)
{
    for (int i = ntaps = 1; i > 0; i--)
    {
        buffer[i] = buffer[i - 1];
    }

    buffer[0] = value;
    for (int i = 0; i < ntaps; i++)
    {
        output += buffer[i] * h[i];
    }
    return output;
}