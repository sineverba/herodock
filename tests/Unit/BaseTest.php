<?php

use PHPUnit\Framework\TestCase;

class DummyTest extends TestCase
{
    /**
     * Run a basic fake test
     *
     * @return void
     */
    public function test_dummy()
    {
        $first_number = 1;
        $second_number = 1;
        $this->assertTrue($first_number === $second_number);
    }
}
