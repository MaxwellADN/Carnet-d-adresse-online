<?php

namespace Appartoo\UserBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class AppartooUserBundle extends Bundle
{
  public function getParent()
  {
    return 'FOSUserBundle';
  }
}
