module UsersHelper
  def lerp(a, b, f)
    return a + f * (b - a);
  end

  def min(first, second)
    if(first <= second)
      first
    else
      second
    end
  end
end
