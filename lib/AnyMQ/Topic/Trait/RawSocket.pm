package AnyMQ::Topic::Trait::RawSocket;

use Any::Moose 'Role';

sub BUILD {}; after 'BUILD' => sub {
    my ($self) = @_;

};

# publish to a topic
before 'publish' => sub {
    my ($self, @events) = @_;

    my $pub = $self->bus->server_socket;

    foreach my $event (@events) {
        # send as json to connected listeners
        #$self->bus->_pub_socket->push_write(json => $event);
    }
};

# subscribe to a topic
before 'add_subscriber' => sub {
    my ($self, $queue) = @_;

    # get subscriber socket
    my $sub = $self->bus->server_socket;

    my $topic_name = $self->name;

    # add callback for this topic
    #$sub->push_read(json => sub {
    #    my (@x) = @_;
    #    warn "read: @x";
    #    $self->cv->send;
    #});
};

1;
