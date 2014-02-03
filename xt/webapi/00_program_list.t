#!perl

use strict;
use warnings;
use utf8;
use WWW::NHKProgram::API;

use Test::Deep;
use Test::More;

my $client = WWW::NHKProgram::API->new(
    api_key => $ENV{NHK_PROGRAM_API_KEY},
);

subtest 'Get response as hashref certainly' => sub {
    my $program_list = $client->list({
        area    => 130,
        service => 'g1',
        date    => '2014-02-04',
    });
    is scalar @$program_list, 62, 'check response length';

    subtest 'Check program information' => sub {
        my $first_program = $program_list->[0];
        cmp_deeply(
            $first_program,
            +{
                'event_id' => '02027',
                'area' => {
                    'name' => "東京",
                    'id' => '130'
                },
                'start_time' => '2014-02-04T04:10:00+09:00',
                'service' => {
                    'logo_l' => {
                        'width' => '200',
                        'url' => 'http://www.nhk.or.jp/common/img/media/gtv-200x200.png',
                        'height' => '200'
                    },
                    'logo_m' => {
                        'width' => '200',
                        'url' => 'http://www.nhk.or.jp/common/img/media/gtv-200x100.png',
                        'height' => '100'
                    },
                    'logo_s' => {
                        'width' => '100',
                        'url' => 'http://www.nhk.or.jp/common/img/media/gtv-100x50.png',
                        'height' => '50'
                    },
                    'name' => "ＮＨＫ総合１",
                    'id' => 'g1'
                },
                'end_time' => '2014-02-04T04:15:00+09:00',
                'subtitle' => '',
                'genres' => [
                    '0207'
                ],
                'id' => '2014020402027',
                'title' => "ＮＨＫプレマップ"
            }
        );

        my $last_program = $program_list->[-1];
        cmp_deeply(
            $last_program,
            +{
                'event_id' => '02041',
                'area' => {
                    'name' => "東京",
                    'id' => '130'
                },
                'start_time' => '2014-02-05T04:10:00+09:00',
                'service' => {
                    'logo_l' => {
                        'width' => '200',
                        'url' => 'http://www.nhk.or.jp/common/img/media/gtv-200x200.png',
                        'height' => '200'
                    },
                    'logo_m' => {
                        'width' => '200',
                        'url' => 'http://www.nhk.or.jp/common/img/media/gtv-200x100.png',
                        'height' => '100'
                    },
                    'logo_s' => {
                        'width' => '100',
                        'url' => 'http://www.nhk.or.jp/common/img/media/gtv-100x50.png',
                        'height' => '50'
                    },
                    'name' => "ＮＨＫ総合１",
                    'id' => 'g1'
                },
                'end_time' => '2014-02-05T04:15:00+09:00',
                'subtitle' => '',
                'genres' => [
                    '0207'
                ],
                'id' => '2014020402041',
                'title' => "ＮＨＫプレマップ"
            }
        );
    };
};

done_testing;

